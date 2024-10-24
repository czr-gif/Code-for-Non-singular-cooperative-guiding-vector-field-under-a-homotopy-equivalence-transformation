function [sys,x0,str,ts,simStateCompliance] = HSCC_2_7_vfgenerator(t,x,u,flag,initial)
% 异构系统协同控制——5_vfCMPF问题——路径跟踪控制器（基于非奇异协同向量场方法）
% 模型创建于2023.3.21
% 输入参数说明
% i：模型代号
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
    sys=mdlDerivatives(t,x,u);

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

sizes.NumContStates  = 3;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 4;
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
function sys=mdlDerivatives(t,x,u)
xd = u(1);
yd = u(2);
thetad = u(3);
cooperation = u(4);
v = 1;
wd = 0.5*sin(t);
dxd = v*cos(thetad);
dyd = v*sin(thetad);
theta = x(3);

Pxy = PRI(thetad)*x(1:2) - PRI(thetad)*[xd;yd];
Px = Pxy(1);
Py = Pxy(2);
phi1 = Px - (-cos(theta)+2*cos(2*theta));
phi2 = Py - (sin(theta)+2*sin(2*theta));
u1 = sin(theta)-4*sin(2*theta)-phi1;
u2 = cos(theta)+4*cos(2*theta)-phi2;
dtheta = 1+phi1*(sin(theta)-4*sin(2*theta))+phi2*(cos(theta)+4*cos(2*theta));
dtheta_co = dtheta + cooperation;
atc = [dxd;dyd]-IRP(thetad)*S(wd)*Pxy+IRP(thetad)*[u1;u2];

sys = [atc(1);atc(2);dtheta_co];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%离散状态更新子函数
function sys=mdlUpdate(t,x,u)

sys = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%输出子函数
function sys=mdlOutputs(t,x,u)
xd = u(1);
yd = u(2);
thetad = u(3);

Pxy = PRI(thetad)*x(1:2) - PRI(thetad)*[xd;yd];
alpha = Pxy(1)^2/4+Pxy(2)^2-1;
sys = [x(1);x(2);x(3);alpha];

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

