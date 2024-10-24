%% Before running this code, please run model_2D_ellipse or model_2D_Trefoil
close all
cool=get(gca,'colororder');
figure(1)

x1p = out.vf(1,1);
y1p = out.vf(1,2);

x2p = out.vf1(1,1);
y2p = out.vf1(1,2);

x0p = out.simout(1,1);
y0p = out.simout(1,2);

x1 = out.vf(1,1);
y1 = out.vf(1,2);

x2 = out.vf1(1,1);
y2 = out.vf1(1,2);

x0 = out.simout(1,1);
y0 = out.simout(1,2);

p0 = plot(x0p,y0p,'o','color',cool(3,:));
hold on
p0line = plot(x0,y0,'Linewidth',1.5,'linestyle','--','color',cool(3,:));
p1 = plot(x1p,y1p,'o','color',cool(1,:));
p1line = plot(x1,y1,'Linewidth',1.5,'color',cool(1,:));
p2 = plot(x2p,y2p,'o','color',cool(2,:));
p2line = plot(x2,y2,'Linewidth',1.5,'color',cool(2,:));
axis([-2.5 6 -2 16]) % For trefoil
% axis([-1 6 -2 16]) % For ellipse

grid on
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
title('\textbf{Robot Paths in $\{ I \}$}','interpreter','LaTeX')
legend([p0line,p1line,p2line],'Moving target path','Robot 1 path','Robot 2 path','interpreter','LaTeX','Location','southeast')

for k = 1:150
    x1p = out.vf(1+k*10,1);
    y1p = out.vf(1+k*10,2);

    x2p = out.vf1(1+k*10,1);
    y2p = out.vf1(1+k*10,2);

    x0p = out.simout(1+k*10,1);
    y0p = out.simout(1+k*10,2);

    x1(1+k) = x1p;
    y1(1+k) = y1p;

    x2(1+k) = x2p;
    y2(1+k) = y2p;

    x0(1+k) = x0p;
    y0(1+k) = y0p;

    set(p0,'XData',x0p,'YData',y0p);
    set(p1,'XData',x1p,'YData',y1p);
    set(p2,'XData',x2p,'YData',y2p);
    set(p0line,'XData',x0,'YData',y0);
    set(p1line,'XData',x1,'YData',y1);
    set(p2line,'XData',x2,'YData',y2);
    drawnow;
    f=getframe(gcf);
    imind=frame2im(f);
    [imind,cm]=rgb2ind(imind,32);
    if k==1
        imwrite(imind,cm,'2Di.gif','GIF','Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(imind,cm,'2Di.gif','GIF','WriteMode','append','DelayTime',0.1);
    end
end    

%% Chinese

close all
cool=get(gca,'colororder');
figure(1)

x1p = out.vf(1,1);
y1p = out.vf(1,2);

x2p = out.vf1(1,1);
y2p = out.vf1(1,2);

x0p = out.simout(1,1);
y0p = out.simout(1,2);

x1 = out.vf(1,1);
y1 = out.vf(1,2);

x2 = out.vf1(1,1);
y2 = out.vf1(1,2);

x0 = out.simout(1,1);
y0 = out.simout(1,2);

p0 = plot(x0p,y0p,'o','color',cool(3,:));
hold on
p0line = plot(x0,y0,'Linewidth',1.5,'linestyle','--','color',cool(3,:));
p1 = plot(x1p,y1p,'o','color',cool(1,:));
p1line = plot(x1,y1,'Linewidth',1.5,'color',cool(1,:));
p2 = plot(x2p,y2p,'o','color',cool(2,:));
p2line = plot(x2,y2,'Linewidth',1.5,'color',cool(2,:));
axis([-2.5 6 -2 16]) % For trefoil
% axis([-1 6 -2 16]) % For ellipse

grid on
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
title('静止系下的智能体轨迹')
legend([p0line,p1line,p2line],'移动路径','智能体1的轨迹','智能体2的轨迹','Location','southeast')

for k = 1:150
    x1p = out.vf(1+k*10,1);
    y1p = out.vf(1+k*10,2);

    x2p = out.vf1(1+k*10,1);
    y2p = out.vf1(1+k*10,2);

    x0p = out.simout(1+k*10,1);
    y0p = out.simout(1+k*10,2);

    x1(1+k) = x1p;
    y1(1+k) = y1p;

    x2(1+k) = x2p;
    y2(1+k) = y2p;

    x0(1+k) = x0p;
    y0(1+k) = y0p;

    set(p0,'XData',x0p,'YData',y0p);
    set(p1,'XData',x1p,'YData',y1p);
    set(p2,'XData',x2p,'YData',y2p);
    set(p0line,'XData',x0,'YData',y0);
    set(p1line,'XData',x1,'YData',y1);
    set(p2line,'XData',x2,'YData',y2);
    drawnow;
    f=getframe(gcf);
    imind=frame2im(f);
    [imind,cm]=rgb2ind(imind,32);
    if k==1
        imwrite(imind,cm,'2Dic.gif','GIF','Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(imind,cm,'2Dic.gif','GIF','WriteMode','append','DelayTime',0.1);
    end
end    

close all
cool=get(gca,'colororder');
figure(1)

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

x1p = Px1(1);
y1p = Py1(1);

x2p = Px2(1);
y2p = Py2(1);

x1 = Px1(1);
y1 = Py1(1);

x2 = Px2(1);
y2 = Py2(1);

p1 = plot(x1p,y1p,'o','color',cool(1,:));
hold on
p1line = plot(x1,y1,'Linewidth',1.5,'color',cool(1,:));
p2 = plot(x2p,y2p,'o','color',cool(2,:));
p2line = plot(x2,y2,'Linewidth',1.5,'color',cool(2,:));
axis([-3 3 -2.5 1.5])
grid on
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
title('\textbf{Robot Paths in $\{P\}$}','interpreter','LaTeX')
legend([p1line,p2line],'Robot 1 path in $\{P\}$','Robot 2 path in $\{P\}$','interpreter','LaTeX','Location','southeast')

for k = 1:150
    x1p = Px1(1+k*10);
    y1p = Py1(1+k*10);

    x2p = Px2(1+k*10);
    y2p = Py2(1+k*10);

    x1(1+k) = x1p;
    y1(1+k) = y1p;

    x2(1+k) = x2p;
    y2(1+k) = y2p;

    set(p1,'XData',x1p,'YData',y1p);
    set(p2,'XData',x2p,'YData',y2p);
    set(p1line,'XData',x1,'YData',y1);
    set(p2line,'XData',x2,'YData',y2);
    drawnow;
    f=getframe(gcf);
    imind=frame2im(f);
    [imind,cm]=rgb2ind(imind,32);
    if k==1
        imwrite(imind,cm,'2Dp.gif','GIF','Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(imind,cm,'2Dp.gif','GIF','WriteMode','append','DelayTime',0.1);
    end
end    

%% Chinese
close all
cool=get(gca,'colororder');
figure(1)

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

x1p = Px1(1);
y1p = Py1(1);

x2p = Px2(1);
y2p = Py2(1);

x1 = Px1(1);
y1 = Py1(1);

x2 = Px2(1);
y2 = Py2(1);

p1 = plot(x1p,y1p,'o','color',cool(1,:));
hold on
p1line = plot(x1,y1,'Linewidth',1.5,'color',cool(1,:));
p2 = plot(x2p,y2p,'o','color',cool(2,:));
p2line = plot(x2,y2,'Linewidth',1.5,'color',cool(2,:));
axis([-3 3 -2.5 1.5])
grid on
xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
title('移动系下的智能体轨迹')
legend([p1line,p2line],'智能体1的轨迹','智能体2的轨迹','Location','southeast')

for k = 1:150
    x1p = Px1(1+k*10);
    y1p = Py1(1+k*10);

    x2p = Px2(1+k*10);
    y2p = Py2(1+k*10);

    x1(1+k) = x1p;
    y1(1+k) = y1p;

    x2(1+k) = x2p;
    y2(1+k) = y2p;

    set(p1,'XData',x1p,'YData',y1p);
    set(p2,'XData',x2p,'YData',y2p);
    set(p1line,'XData',x1,'YData',y1);
    set(p2line,'XData',x2,'YData',y2);
    drawnow;
    f=getframe(gcf);
    imind=frame2im(f);
    [imind,cm]=rgb2ind(imind,32);
    if k==1
        imwrite(imind,cm,'2Dpc.gif','GIF','Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(imind,cm,'2Dpc.gif','GIF','WriteMode','append','DelayTime',0.1);
    end
end    