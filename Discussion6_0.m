close all;clear;clc;
vd = 0;
wd = 0;
v = 3;
d = [0;0;0;0];

tspan = 0:0.01:20;

y0 = d;
% global err ind pfe;
% err = zeros(2,length(tspan));
% pfe = zeros(1,length(tspan));
% ind = 1;
[t, y] = ode45(@(t,y) nhmpf_60(t, y, v), tspan, y0);

plot(y(:,1),y(:,2),'Linewidth',1.5)
hold on
grid on
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX','fontsize',15)
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX','fontsize',15)
title('\textbf{Robot Paths in $\{ I \}$, $v=3v_d$}','interpreter','LaTeX','fontsize',15)

% figure
% plot(tspan,sqrt(sum(err.^2)),'Linewidth',1.5)
% grid on
% set(gca, 'XGrid', 'off', 'YGrid', 'on');
% xlabel('$t[\mathrm{s}]$','interpreter','LaTeX','fontsize',15)
% ylabel('$\Vert h-g \Vert$','interpreter','LaTeX','fontsize',15)
% title('\textbf{The Orientation Error, $v=0.8v_d$}','interpreter','LaTeX','fontsize',15)

% figure
% plot(tspan,pfe)