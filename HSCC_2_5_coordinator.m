function [sys,x0,str,ts,simStateCompliance] = HSCC_2_5_coordinator(t,x,u,flag,A,B,i)
% 异构系统协同控制——5_vfCMPF问题——协同协议
% 模型创建于2023.3.21
% 输入参数说明
% i：模型代号
switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSize;

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
    sys=mdlOutputs(t,x,u,A,B,i);

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
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSize

sizes = simsizes;

sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed

sys = simsizes(sizes);

%
% initialize the initial conditions
%
x0  = [];

%
% str is always an empty matrix
%
str = [];

ts  = [0 0];

simStateCompliance = 'UnknownSimState';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%连续时间模型求导子函数
function sys=mdlDerivatives(t,x,u)


sys = [];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%离散状态更新子函数
function sys=mdlUpdate(t,x,u)

sys = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%输出子函数
function sys=mdlOutputs(t,x,u,A,B,i)
b = length(B);
core = 0;
Delta = [0 pi/4;-pi/4 0];
for j = 1:1:b
    core = core - A(i,j)*(u(i) - u(j)-Delta(i,j));
end
sys = core;

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

