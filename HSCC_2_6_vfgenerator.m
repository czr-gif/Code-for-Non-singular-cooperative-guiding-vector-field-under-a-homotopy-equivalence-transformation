function [sys,x0,str,ts,simStateCompliance] = HSCC_2_6_vfgenerator(t,x,u,flag,initial,i)
% 异构系统协同控制——6_vfCMPF问题——路径跟踪控制器（基于非奇异协同向量场方法）
% 模型创建于2023.4.7
% 输入参数说明
switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSize(initial);

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u,i);

  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,
    sys=mdlUpdate(t,x,u);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u);

  %%%%%%%%%%%%%%%%%%%%%%%
  % GetTimeOfNextVarHit %
  %%%%%%%%%%%%%%%%%%%%%%%
  case 4,
    sys=mdlGetTimeOfNextVarHit(t,x,u);

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
  case 9,
    sys=mdlTerminate(t,x,u);

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 初始化子函数
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSize(initial)

sizes = simsizes;

sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 8;
sizes.NumInputs      = 10;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed

sys = simsizes(sizes);

%
% initialize the initial conditions
%
x0  = initial;

%
% str is always an empty matrix
%
str = [];

ts  = [0 0];

simStateCompliance = 'UnknownSimState';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%连续时间模型求导子函数
function sys=mdlDerivatives(t,x,u,i)
xd = u(1);
yd = u(2);
zd = u(3);
phi = u(4);
theta = u(5);
psi = u(6);
ws = u(7:10);

ix = x(1);
iy = x(2);
iz = x(3);
iw = x(4);
A = pi/6*[0 1 0 0;
    -1 0 1 0
    0 -1 0  1
    0 0 -1 0];

core = 0;
for j = 1:1:4
    if A(i,j) ~= 0 
        core = core + ws(i) - ws(j) - A(i,j);
    end
end

u = 1+0.1*sin(t);
v = 0.1*cos(t);
w = 0.1*sin(t);
PCI = rotx(phi)*roty(theta)*rotz(psi);
dxyz = PCI'*[u,v,w]';
p = 0.01*sin(t);
q = 0.01*sin(t);
r = 0.01*sin(t);
% p = 0;
% q = 0;
% r = 0;
dphi = p + (q * sin(phi) + r * cos(phi)) * tan(theta);
dtheta = q * cos(phi) - r * sin(phi);
dpsi = (q * sin(phi) + r * cos(phi)) / cos(theta);

Pxyz = PCI*([ix;iy;iz] - [xd;yd;zd]);
px = Pxyz(1);
py = Pxyz(2);
pz = Pxyz(3);

alpha1 = px - 2*cos(iw);
alpha2 = py - sin(iw);
alpha3 = pz - cos(iw/2);

k1 = 1;k2 = 1;k3 =1;
u1d = 2*sin(iw) - k1*alpha1;
u2d = -cos(iw) - k2*alpha2;
u3d = 0.5*sin(iw/2) - k3*alpha3;
kc = 5;
dw = -1 - k1*alpha1*(2*sin(iw)) - k2*alpha2*(-cos(iw)) - k3*alpha3*(0.5*sin(iw/2)) - kc * core;
ud = [u1d;u2d;u3d];
S1 = [1 0 0;
      0 0 1;
      0 -1 0]*dphi;
S2 = [0 0 -1;
      0 1 0;
      1 0 0 ]*dtheta;
S3 = [0 1 0;
      -1 0 0;
      0 0 1]*dpsi;
dPCI = S1*rotx(phi)*roty(theta)*rotz(psi) + rotx(phi)*S2*roty(theta)*rotz(psi) + rotx(phi)*roty(theta)*S3*rotz(psi);
dIx = dxyz + PCI\(ud - dPCI*([ix;iy;iz] - [xd;yd;zd]));

sys = [dIx;dw];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%离散状态更新子函数
function sys=mdlUpdate(t,x,u)

sys = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%输出子函数
function sys=mdlOutputs(t,x,u)
xd = u(1);
yd = u(2);
zd = u(3);
phi = u(4);
theta = u(5);
psi = u(6);
ws = u(7:10);

ix = x(1);
iy = x(2);
iz = x(3);
iw = x(4);
PCI = rotx(phi)*roty(theta)*rotz(psi);

Pxyz = PCI*([ix;iy;iz] - [xd;yd;zd]);
px = Pxyz(1);
py = Pxyz(2);
pz = Pxyz(3);

alpha1 = px - 2*cos(iw);
alpha2 = py - sin(iw);
alpha3 = pz - cos(iw/2);

alpha = alpha1^2 + alpha2^2 + alpha3^2;
sys = [ix;iy;iz;px;py;pz;iw;alpha];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%下一次采样时间计算（变步长离散系统）
function sys=mdlGetTimeOfNextVarHit(t,x,u)

sampleTime = 1;    %  Example, set the next hit to be one second later.
sys = t + sampleTime;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%结束
function sys=mdlTerminate(t,x,u)

sys = [];

function out = PRI(phi)
% I系到P系
out = [cos(phi) sin(phi);-sin(phi) cos(phi)];

function out = IRP(phi)
% P系到I系
out = [cos(phi) -sin(phi);sin(phi) cos(phi)];

function out = S(wd)
out = [0 wd;-wd 0];

