%% Fig 1a
close all; clc;clear;
theta = 0:pi/36:6*pi;
x = cos(theta);
y = sin(theta);
z = zeros(length(x),1);
plot3(x,y,z,'LineWidth',2,'color','#2F3061')
view([4 4 4])
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
zlabel('$\theta[\mathrm{rad}]$','interpreter','LaTeX')
title('\textbf{A circle on the plane}','interpreter','LaTeX','fontsize',14)
figure(2)

theta = 0:pi/36:10;
x = cos(theta);
y = sin(theta);
plot3(x,y,theta,'--','LineWidth',2,'color','r')
hold on
z0 = zeros(length(x),1);
plot3(x,y,z0,'LineWidth',2,'color',[0 0 0])
view([4 4 2])
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
zlabel('$\theta[\mathrm{rad}]$','interpreter','LaTeX')
title('A helical curve in space and its projection','interpreter','LaTeX')

%% Fig 1b
clear; close all
% 定义两个曲面的方程
[Y1,theta1] = meshgrid(-1:0.1:1,0:0.1:10);
[X2,theta2] = meshgrid(-1:0.1:1,0:0.1:10);

X1 = cos(theta1);
Y2 = sin(theta2);
figure
surf(X1,Y1,theta1, 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'FaceColor', 'blue');
hold on
surf(X2,Y2,theta2, 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'FaceColor', 'yellow');

theta = 0:pi/36:10;
x = cos(theta);
y = sin(theta);
plot3(x,y,theta,'--','LineWidth',2,'color','r')
z0 = zeros(length(x),1);
plot3(x,y,z0,'LineWidth',2,'color',[0 0 0])
hold on
view([4 4 2])
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
zlabel('$\theta$','interpreter','LaTeX')
title('\textbf{A helical curve in space and its projection}','interpreter','LaTeX','fontsize',14)
legend('$x=\cos{\theta}$','$y=\sin{\theta}$','The intersection','The projection','interpreter','LaTeX', 'Location', 'northoutside', 'Orientation', 'horizontal')
% annotation('textbox', [0.5, 0.9, 0.1, 0.1], 'String', 'The intersection of hypersurfaces $x=\cos{\theta}$ and $y=\sin{\theta}$', 'EdgeColor', 'none', 'HorizontalAlignment', 'center', 'FontSize', 12, 'FontWeight', 'bold','interpreter','LaTeX');


%% Fig 1c
close all;clc;clear;
theta = 0:pi/36:6*pi;
x = cos(theta);
y = sin(theta);
% f = @(t,y)[-2*(y(1)^2+y(2)^2-1)*y(1)-y(2);-2*(y(1)^2+y(2)^2-1)*y(2)+y(1)];


% figure(2)
m = 1;
[X,Y] = meshgrid(-m:0.15:m,-m:0.15:m);
% DX = -2*(X.^2+Y.^2-1).*X + Y;
% DY = -2*(X.^2+Y.^2-1).*Y - X;
DX = -2*(X.^2+Y.^2-1).*X - Y;
DY = -2*(X.^2+Y.^2-1).*Y + X;
normal = (DX.^2 + DY.^2).^0.5;
quiver(X,Y,DX./normal,DY./normal,0.6,'LineWidth',1,'color','#6CA6C1');
hold on;
plot(x,y,'LineWidth',1.5,'color','#2F3061')
axis equal
hold on
axis([-1.1 1.1 -1.1 1.1])
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
title('\textbf{Guiding Vector Field for a Circle}','interpreter','LaTeX','fontsize',14)

%% Fig 1d 
clc;clear; close all
theta = 0:pi/36:10;
x = cos(theta);
y = sin(theta);
plot3(x,y,theta,'--','LineWidth',2,'color','r')
hold on

z0 = zeros(length(x),1);
plot3(x,y,z0,'LineWidth',2,'color',[0 0 0])

defaultColors = get(groot, 'DefaultAxesColorOrder');

[X0, Y0] = meshgrid(-1:2:1, -1:2:1);
Z0 = 0*ones(2,2);
surf(X0, Y0, Z0,'FaceAlpha',.2,'EdgeAlpha',.1,'FaceColor',defaultColors(1,:), 'EdgeColor', 'none');
Z1 = 4*ones(2,2);
surf(X0, Y0, Z1,'FaceAlpha',.2,'EdgeAlpha',.1,'FaceColor',defaultColors(1,:), 'EdgeColor', 'none');
Z2 = 8*ones(2,2);
surf(X0, Y0, Z2,'FaceAlpha',.2,'EdgeAlpha',.1,'FaceColor',defaultColors(1,:), 'EdgeColor', 'none');
view([4 4 2])
m = 1;
quivercolor = defaultColors(1,:);
[X,Y,Theta] = meshgrid(-m:0.2:m,-m:0.2:m,0);
theta = 0;
DX = -X + cos(theta) -sin(theta);
DY = -Y + cos(theta) +sin(theta);
Dtheta = 1-X.*sin(theta)+Y.*cos(theta);
normal = (DX.^2 + DY.^2 + Dtheta.^2).^0.5;
quiver3(X,Y,Theta,DX./normal,DY./normal,Dtheta./normal,'LineWidth',1,'color',quivercolor);

[X,Y,Theta] = meshgrid(-m:0.2:m,-m:0.2:m,4);
theta = 4;
DX = -X + cos(theta) -sin(theta);
DY = -Y + cos(theta) +sin(theta);
Dtheta = 1-X.*sin(theta)+Y.*cos(theta);
normal = (DX.^2 + DY.^2 + Dtheta.^2).^0.5;
quiver3(X,Y,Theta,DX./normal,DY./normal,Dtheta./normal,'LineWidth',1,'color',quivercolor);

[X,Y,Theta] = meshgrid(-m:0.2:m,-m:0.2:m,8);
theta = 8;
DX = -X + cos(theta) -sin(theta);
DY = -Y + cos(theta) +sin(theta);
Dtheta = 1-X.*sin(theta)+Y.*cos(theta);
normal = (DX.^2 + DY.^2 + Dtheta.^2).^0.5;
quiver3(X,Y,Theta,DX./normal,DY./normal,Dtheta./normal,'LineWidth',1,'color',quivercolor);

xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
zlabel('$\theta$','interpreter','LaTeX')
title('\textbf{Non-singular Guiding Vector Field for a Circle}','interpreter','LaTeX','fontsize',14)
% title('圆形路径的非奇异制导向量场')


%% Before running fig 4a-4d, please run model_2D_ellipse or model_2D_Trefoil
clc; clear
%% fig 4a
close all
figure1 = figure(1);
cool=get(gca,'colororder');

p2 = plot(out.vf(:,1),out.vf(:,2),'Linewidth',1.5);
hold on
p3 = plot(out.vf1(:,1),out.vf1(:,2),'Linewidth',1.5);
p1 = plot(out.simout(:,1),out.simout(:,2),'Linewidth',1.5,'linestyle','--');

grid on
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX','fontsize',15)
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX','fontsize',15)
title('\textbf{Robot Paths in $\{ I \}$}','interpreter','LaTeX','fontsize',15)
plot(out.vf(1,1),out.vf(1,2),'o','color',cool(1,:))
plot(out.vf1(1,1),out.vf1(1,2),'o','color',cool(2,:))
legend([p1,p2,p3],'Moving target path','Robot 1 path','Robot 2 path','interpreter','LaTeX','Location','northwest','fontsize',11)
hl = annotation('textbox',[0.5,0.1,0.1,0.1],'LineStyle','-','LineWidth',1,'String','t=0s','interpreter','LaTeX','FitBoxToText','on','EdgeColor','none','fontsize',15);
annotation(figure1,'arrow',[0.552380952380952 0.559523809523809],...
    [0.183333333333333 0.237301587301587]);
annotation(figure1,'arrow',[0.53452380952381 0.488095238095238],...
    [0.15 0.124603174603175]);

%% fig 4c

figure(3)
plot(out.tout,out.vf(:,4),'Linewidth',1.5)
hold on
plot(out.tout,out.vf1(:,4),'Linewidth',1.5)
grid on
legend('Robot 1 path error','Robot 2 path error','fontsize',10)

xlabel('$t[\mathrm{s}]$','interpreter','LaTeX','fontsize',10)
ylabel('$\alpha[\mathrm{m^2}]$','interpreter','LaTeX','fontsize',10)
title('$\mathbf{\alpha = x^2/4+y^2-1}$','interpreter','LaTeX','fontsize',10)

%%  fig 4d
close all
fig = figure(2);
width = 800; % 宽度
height = 250; % 高度
set(fig, 'Position', [100, 100, width, height]);
plot(out.tout,out.vf(:,3)-out.vf1(:,3),'Linewidth',1.5)
hold on
plot([0 15],[pi/4 pi/4],'Linewidth',1.5,'linestyle','--')
grid on
set(gca, 'XGrid', 'off', 'YGrid', 'on');

legend('$\theta^{[1]}-\theta^{[2]}$','$\Delta^{[1,2]}$','interpreter','LaTeX','fontsize',15,'Location','southeast')
set(gca,'yTick',0:pi/12:pi/3);
set(gca,'yTicklabel',{'0','π/12','π/6','π/4','π/3'})
axis([0 15 0 pi/3])
xlabel('$t[\mathrm{s}]$','interpreter','LaTeX','fontsize',18)
ylabel('$\theta$','interpreter','LaTeX','fontsize',18)
title('\textbf{Inter-robot Along-path Parameter}','interpreter','LaTeX','fontsize',18)

%% fig 4b
close all
Px1 = zeros(length(out.vf(:,1)),1);
Py1 = zeros(length(out.vf(:,1)),1);
for i=1:1:length(out.vf(:,1))
    P = R(out.simout(i,3))*(out.vf(i,1:2)'-out.simout(i,1:2)');
    Px1(i) = P(1);
    Py1(i) = P(2);
end
Px2 = zeros(length(out.vf(:,1)),1);
Py2 = zeros(length(out.vf(:,1)),1);
for i=1:1:length(out.vf(:,1))
    P = R(out.simout(i,3))*(out.vf1(i,1:2)'-out.simout(i,1:2)');
    Px2(i) = P(1);
    Py2(i) = P(2);
end
figure1 = figure;
plot(Px1,Py1,'Linewidth',1.5);
hold on
plot(Px2,Py2,'Linewidth',1.5);
% figure(4)
% 
% p2 = plot(out.vf(:,1)-out.simout(:,1),out.vf(:,2)-out.simout(:,2),'Linewidth',2,'color','b');
% hold on
% p3 = plot(out.vf1(:,1)-out.simout(:,1),out.vf1(:,2)-out.simout(:,2),'Linewidth',2,'color','r');
% 
grid on
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX','FontSize',15)
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX','FontSize',15)
title('\textbf{Robot Paths in $\{P\}$}','interpreter','LaTeX','FontSize',15)
plot(Px1(1),Py1(1),'o','color','b')
plot(Px2(1),Py2(1),'o','color','r')
plot(Px1(500),Py1(500),'o','color','b')
plot(Px2(500),Py2(500),'o','color','r')
plot(Px1(750),Py1(750),'o','color','b')
plot(Px2(750),Py2(750),'o','color','r')
legend('Robot 1 path in $\{P\}$','Robot 2 path in $\{P\}$','interpreter','LaTeX','FontSize',12,'Location','Southeast')
annotation('textbox',[0.6,0.22,0.1,0.1],'LineStyle','-','LineWidth',1,'String','t=0s','interpreter','LaTeX','FitBoxToText','on','EdgeColor','none','FontSize',15)
annotation('textbox',[0.15,0.4,0.1,0.1],'LineStyle','-','LineWidth',1,'String','t=5s','interpreter','LaTeX','FitBoxToText','on','EdgeColor','none','FontSize',15)
annotation('textbox',[0.35,0.7,0.1,0.1],'LineStyle','-','LineWidth',1,'String','t=7.5s','interpreter','LaTeX','FitBoxToText','on','EdgeColor','none','FontSize',15)
annotation(figure1,'arrow',[0.346428571428571 0.271428571428571],...
    [0.773603174603175 0.804761904761905]);
annotation(figure1,'arrow',[0.460714285714286 0.489285714285714],...
    [0.777777777777778 0.795238095238095]);
annotation(figure1,'arrow',[0.205952380952381 0.344047619047619],...
    [0.502174603174603 0.604761904761905]);
annotation(figure1,'arrow',[0.195238095238095 0.24047619047619],...
    [0.43868253968254 0.292063492063492]);
annotation(figure1,'arrow',[0.596428571428571 0.404761904761905],...
    [0.281539682539683 0.238095238095238]);
annotation(figure1,'arrow',[0.670238095238095 0.694047619047619],...
    [0.325984126984127 0.40952380952381]);
fig = figure(2);
width = 800; % 宽度
height = 250; % 高度
set(fig, 'Position', [100, 100, width, height]);
theta1 = out.vf(:,3);
theta2 = out.vf1(:,3);

xd1 = -cos(theta1)+2*cos(2*theta1);
yd1 = sin(theta1)+2*sin(2*theta1);
xd2 = -cos(theta2)+2*cos(2*theta2);
yd2 = sin(theta2)+2*sin(2*theta2);
e1 = (Px1-xd1).^2 + (Py1-yd1).^2; 
e2 = (Px2-xd2).^2 + (Py2-yd2).^2; 
plot(out.tout,e1,'Linewidth',1.5)
hold on
plot(out.tout,e2,'Linewidth',1.5)
grid on
set(gca, 'XGrid', 'off', 'YGrid', 'on');
legend('Robot 1 path error','Robot 2 path error','fontsize',15,'interpreter','LaTeX')
axis([0 5 0 8])
xlabel('$t[\mathrm{s}]$','interpreter','LaTeX','fontsize',18)
ylabel('$\Vert \Phi \Vert^2[\mathrm{m^2}]$','interpreter','LaTeX','fontsize',18)
title('\textbf{Path Following Errors}','interpreter','LaTeX','fontsize',18)

%% Before running fig 6a-6d, please run model_2D_ellipse or model_2D_Trefoil
clc; clear
%% Fig 6a
close all
figure(1)
plot3(out.v1(:,1),out.v1(:,2),out.v1(:,3),'Linewidth',1.5)
hold on
plot3(out.v2(:,1),out.v2(:,2),out.v2(:,3),'Linewidth',1.5)
plot3(out.v3(:,1),out.v3(:,2),out.v3(:,3),'Linewidth',1.5)
plot3(out.v4(:,1),out.v4(:,2),out.v4(:,3),'Linewidth',1.5)
plot3(out.leader(:,1),out.leader(:,2),out.leader(:,3),'Linewidth',1.5)

grid on
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
zlabel('$z[\mathrm{m}]$','interpreter','LaTeX')
title('\textbf{Aircraft Paths in $\{ I \}$}','interpreter','LaTeX','fontsize',14)
% plot(out.vf(1,1),out.vf(1,2),'o','color','r')
% plot(out.vf1(1,1),out.vf1(1,2),'o','color','#FFC300')
legend('Aircraft 1 path','Aircraft 2 path','Aircraft 3 path','Aircraft 4 path','Moving target path','interpreter','LaTeX')
% hl = annotation('textbox',[0.4,0.1,0.1,0.1],'LineStyle','-','LineWidth',1,'String','t=0s','interpreter','LaTeX','FitBoxToText','on','EdgeColor','none')

%% Fig 6b
close all
figure(1)
p1 = plot3(out.v1(:,4),out.v1(:,5),out.v1(:,6),'Linewidth',0.5);
hold on
p2 = plot3(out.v2(:,4),out.v2(:,5),out.v2(:,6),'Linewidth',0.5);
p3 = plot3(out.v3(:,4),out.v3(:,5),out.v3(:,6),'Linewidth',0.5);
p4 = plot3(out.v4(:,4),out.v4(:,5),out.v4(:,6),'Linewidth',0.5);

grid on
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
zlabel('$z[\mathrm{m}]$','interpreter','LaTeX')
t1 = 1134;
plot3(out.v1(t1,4),out.v1(t1,5),out.v1(t1,6),'o','color',[0    0.4470    0.7410])
plot3(out.v2(t1,4),out.v2(t1,5),out.v2(t1,6),'o','color',[0.8500    0.3250    0.0980])
plot3(out.v3(t1,4),out.v3(t1,5),out.v3(t1,6),'o','color',[0.9290    0.6940    0.1250])
plot3(out.v4(t1,4),out.v4(t1,5),out.v4(t1,6),'o','color',[0.4940    0.1840    0.5560])
col = [0 0 0];
plot3([out.v1(t1,4);out.v2(t1,4)],[out.v1(t1,5);out.v2(t1,5)],[out.v1(t1,6);out.v2(t1,6)],'Linewidth',2,'color',col)
plot3([out.v2(t1,4);out.v3(t1,4)],[out.v2(t1,5);out.v3(t1,5)],[out.v2(t1,6);out.v3(t1,6)],'Linewidth',2,'color',col)
plot3([out.v3(t1,4);out.v4(t1,4)],[out.v3(t1,5);out.v4(t1,5)],[out.v3(t1,6);out.v4(t1,6)],'Linewidth',2,'color',col)
t1 = 1;
plot3(out.v1(t1,4),out.v1(t1,5),out.v1(t1,6),'c:d','color',[0    0.4470    0.7410])
plot3(out.v2(t1,4),out.v2(t1,5),out.v2(t1,6),'c:d','color',[0.8500    0.3250    0.0980])
plot3(out.v3(t1,4),out.v3(t1,5),out.v3(t1,6),'c:d','color',[0.9290    0.6940    0.1250])
plot3(out.v4(t1,4),out.v4(t1,5),out.v4(t1,6),'c:d','color',[0.4940    0.1840    0.5560])
col = [0.6350    0.0780    0.1840];
plot3([out.v1(t1,4);out.v2(t1,4)],[out.v1(t1,5);out.v2(t1,5)],[out.v1(t1,6);out.v2(t1,6)],'Linewidth',2,'color',col)
plot3([out.v2(t1,4);out.v3(t1,4)],[out.v2(t1,5);out.v3(t1,5)],[out.v2(t1,6);out.v3(t1,6)],'Linewidth',2,'color',col)
plot3([out.v3(t1,4);out.v4(t1,4)],[out.v3(t1,5);out.v4(t1,5)],[out.v3(t1,6);out.v4(t1,6)],'Linewidth',2,'color',col)

title('\textbf{Aircraft Paths in $\{ P \}$}','interpreter','LaTeX','fontsize',14)
% plot(out.vf(1,1),out.vf(1,2),'o','color','r')
% plot(out.vf1(1,1),out.vf1(1,2),'o','color','#FFC300')
legend([p1,p2,p3,p4],'Aircraft 1 path','Aircraft 2 path','Aircraft 3 path','Aircraft 4 path','interpreter','LaTeX')
% hl = annotation('textbox',[0.4,0.1,0.1,0.1],'LineStyle','-','LineWidth',1,'String','t=0s','interpreter','LaTeX','FitBoxToText','on','EdgeColor','none')

%% Fig 6c
close all
figure(3)
figure1 = gcf;
ax1 = axes('Position', [0.1 0.1 0.8 0.8]);
ax2 = axes('Position',[0.3 0.3 0.5 0.3]);
axes(ax1)
plot(out.tout,out.v1(:,8),'Linewidth',1.5)
hold on
plot(out.tout,out.v2(:,8),'Linewidth',1.5)
plot(out.tout,out.v3(:,8),'Linewidth',1.5)
plot(out.tout,out.v4(:,8),'Linewidth',1.5)
grid on
set(gca, 'XGrid', 'off');

% 
xlabel('$t[\mathrm{s}]$','interpreter','LaTeX','fontsize',10)
ylabel('$\Vert \Phi \Vert^2[\mathrm{m^2}]$','interpreter','LaTeX','fontsize',10)
title('\textbf{Path Following Errors}','interpreter','LaTeX','fontsize',14)
x11 = [0.45, 0.3];
y11 = [0.45, 0.3];
annotation('arrow',x11, y11);
legend('Aircraft 1 path error','Aircraft 2 path error','Aircraft 3 path error','Aircraft 4 path error','fontsize',10,'interpreter','LaTeX')
axes(ax2) %小窗口绘图
t0 = 151;
ts = 450;
p1 = plot(out.tout(t0:ts),out.v1(t0:ts,8),'Linewidth',1.5);
p1.LineWidth = 1.5;
hold on
p2 = plot(out.tout(t0:ts),out.v2(t0:ts,8),'Linewidth',1.5);
p2.LineWidth = 1.5;
p3 = plot(out.tout(t0:ts),out.v3(t0:ts,8),'Linewidth',1.5);
p3.LineWidth = 1.5;
p4 = plot(out.tout(t0:ts),out.v4(t0:ts,8),'Linewidth',1.5);
p4.LineWidth = 1.5;
axis([1.5 4.5 0 0.3])
grid on;
set(gca, 'XGrid', 'off');
% xlabel('$t[\mathrm{s}]$','interpreter','LaTeX','fontsize',10)
% ylabel('$\Vert \Phi \Vert^2[\mathrm{m^2}]$','interpreter','LaTeX','fontsize',10)
title('An enlarged depiction of the transitional process.','interpreter','LaTeX','fontsize',10)

%% Fig 6d
close all
figure(2)
plot(out.tout,out.v1(:,7)-out.v2(:,7),'Linewidth',1.5)
hold on
plot(out.tout,out.v2(:,7)-out.v3(:,7),'Linewidth',1.5)
plot(out.tout,out.v3(:,7)-out.v4(:,7),'Linewidth',1.5)
plot([0 20],[pi/6 pi/6],'Linewidth',1.5,'linestyle','--')
grid on
set(gca, 'XGrid', 'off');
legend('$\theta^{[1]}-\theta^{[2]}$','$\theta^{[2]}-\theta^{[3]}$','$\theta^{[3]}-\theta^{[4]}$','$\Delta^{[1,2]}$','interpreter','LaTeX','fontsize',15)
set(gca,'yTick',0:pi/12:pi/3);
set(gca,'yTicklabel',{'0','π/12','π/6','π/4','π/3'})
xlabel('$t[\mathrm{s}]$','interpreter','LaTeX')
ylabel('$\Theta$','interpreter','LaTeX')
title('\textbf{The Differences of Path Parameters}','interpreter','LaTeX','fontsize',14)
