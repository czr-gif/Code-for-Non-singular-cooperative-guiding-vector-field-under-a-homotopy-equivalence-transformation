close all;clear;clc;
vd = 1;
wd = 0;
v = 3;
d0 = [0;0;pi/4];
d = [0;0;0;0];

tspan = 0:0.01:20;

y0 = [d0;d];
global err ind pfe;
err = zeros(2,length(tspan));
pfe = zeros(1,length(tspan));
ind = 1;
[t, y] = ode45(@(t,y) nhmpf(t, y, vd, wd, v), tspan, y0);

plot(y(:,1),y(:,2),'Linewidth',1.5,'LineStyle','--')
hold on
grid on
plot(y(:,4),y(:,5),'Linewidth',1.5)
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX','fontsize',15)
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX','fontsize',15)
title('\textbf{Robot Paths in $\{ I \}$, $v=3v_d$}','interpreter','LaTeX','fontsize',15)
legend('Moving target path','Agent path','interpreter','LaTeX','Location','northwest','fontsize',11)
figure
for i = 1:1:length(t)
    Pxy(i,:) = PRI(y(i,3))*([y(i,4);y(i,5)]-[y(i,1);y(i,2)]);
    pfe(i) = (Pxy(i,1)/2)^2+Pxy(i,2)^2-1;
end
plot(Pxy(:,1),Pxy(:,2),'Linewidth',1.5)
grid on
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX','fontsize',15)
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX','fontsize',15)
title('\textbf{Robot Paths in $\{ P \}$, $v=3v_d$}','interpreter','LaTeX','fontsize',15)
figure
plot(tspan,sqrt(sum(err.^2)),'Linewidth',1.5)
grid on
set(gca, 'XGrid', 'off', 'YGrid', 'on');
xlabel('$t[\mathrm{s}]$','interpreter','LaTeX','fontsize',15)
ylabel('$\Vert h-g \Vert$','interpreter','LaTeX','fontsize',15)
title('\textbf{The Orientation Error, $v=0.8v_d$}','interpreter','LaTeX','fontsize',15)

figure
plot(tspan,pfe)