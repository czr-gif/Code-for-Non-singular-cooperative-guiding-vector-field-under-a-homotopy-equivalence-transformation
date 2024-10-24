%% 3Di
close all
cool=get(gca,'colororder');
figure(1)

x1p = out.v1(1,1);
y1p = out.v1(1,2);
z1p = out.v1(1,3);

x2p = out.v2(1,1);
y2p = out.v2(1,2);
z2p = out.v2(1,3);

x3p = out.v3(1,1);
y3p = out.v3(1,2);
z3p = out.v3(1,3);

x4p = out.v4(1,1);
y4p = out.v4(1,2);
z4p = out.v4(1,3);

x0p = out.leader(1,1);
y0p = out.leader(1,2);
z0p = out.leader(1,3);

x1 = x1p;
y1 = y1p;
z1 = z1p;

x2 = x2p;
y2 = y2p;
z2 = z2p;

x3 = x3p;
y3 = y3p;
z3 = z3p;

x4 = x4p;
y4 = y4p;
z4 = z4p;

x0 = x0p;
y0 = y0p;
z0 = z0p;

p1 = plot3(x1p, y1p, z1p, 'o', 'color', cool(1, :));
hold on
p1line = plot3(x1, y1, z1, 'Linewidth', 1.5, 'color', cool(1, :));

p2 = plot3(x2p, y2p, z2p, 'o', 'color', cool(2, :));
p2line = plot3(x2, y2, z2, 'Linewidth', 1.5, 'color', cool(2, :));

p3 = plot3(x3p, y3p, z3p, 'o', 'color', cool(3, :));
p3line = plot3(x3, y3, z3, 'Linewidth', 1.5, 'color', cool(3, :));

p4 = plot3(x4p, y4p, z4p, 'o', 'color', cool(4, :));
p4line = plot3(x4, y4, z4, 'Linewidth', 1.5, 'color', cool(4, :));

p0 = plot3(x0p, y0p, z0p, 'o', 'color', cool(5, :));
p0line = plot3(x0, y0, z0, 'Linewidth', 1.5, 'color', cool(5, :));

xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
zlabel('$z[\mathrm{m}]$','interpreter','LaTeX')
title('\textbf{Aircraft Paths in $\{ I \}$}','interpreter','LaTeX')
axis([-1,15,-15.48700610255775,1,-0.5,2.5])
view(-37.5,30)
legend([p1line,p2line,p3line,p4line,p0line],'Aircraft 1 path','Aircraft 2 path','Aircraft 3 path','Aircraft 4 path','Moving target path','interpreter','LaTeX','Location','south')
for k = 1:200
    x1p = out.v1(1+k*10, 1);
    y1p = out.v1(1+k*10, 2);
    z1p = out.v1(1+k*10, 3);
    
    x2p = out.v2(1+k*10, 1);
    y2p = out.v2(1+k*10, 2);
    z2p = out.v2(1+k*10, 3);
    
    x3p = out.v3(1+k*10, 1);
    y3p = out.v3(1+k*10, 2);
    z3p = out.v3(1+k*10, 3);
    
    x4p = out.v4(1+k*10, 1);
    y4p = out.v4(1+k*10, 2);
    z4p = out.v4(1+k*10, 3);

    x0p = out.leader(1+k*10, 1);
    y0p = out.leader(1+k*10, 2);
    z0p = out.leader(1+k*10, 3);

    x1(1+k) = x1p;
    y1(1+k) = y1p;
    z1(1+k) = z1p;
    
    x2(1+k) = x2p;
    y2(1+k) = y2p;
    z2(1+k) = z2p;
    
    x3(1+k) = x3p;
    y3(1+k) = y3p;
    z3(1+k) = z3p;
    
    x4(1+k) = x4p;
    y4(1+k) = y4p;
    z4(1+k) = z4p;


    x0(1+k) = x0p;
    y0(1+k) = y0p;
    z0(1+k) = z0p;

    set(p0, 'XData', x0p, 'YData', y0p, 'ZData', z0p);
    set(p1, 'XData', x1p, 'YData', y1p, 'ZData', z1p);
    set(p2, 'XData', x2p, 'YData', y2p, 'ZData', z2p);
    set(p3, 'XData', x3p, 'YData', y3p, 'ZData', z3p);
    set(p4, 'XData', x4p, 'YData', y4p, 'ZData', z4p);
    set(p0line, 'XData', x0, 'YData', y0, 'ZData', z0);
    set(p1line, 'XData', x1, 'YData', y1, 'ZData', z1);
    set(p2line, 'XData', x2, 'YData', y2, 'ZData', z2);
    set(p3line, 'XData', x3, 'YData', y3, 'ZData', z3);
    set(p4line, 'XData', x4, 'YData', y4, 'ZData', z4);

    drawnow;
    f=getframe(gcf);
    imind=frame2im(f);
    [imind,cm]=rgb2ind(imind,32);
    if k==1
        imwrite(imind,cm,'3Di.gif','GIF','Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(imind,cm,'3Di.gif','GIF','WriteMode','append','DelayTime',0.1);
    end
end    
%% 3Dic
close all
cool=get(gca,'colororder');
figure(1)

x1p = out.v1(1,1);
y1p = out.v1(1,2);
z1p = out.v1(1,3);

x2p = out.v2(1,1);
y2p = out.v2(1,2);
z2p = out.v2(1,3);

x3p = out.v3(1,1);
y3p = out.v3(1,2);
z3p = out.v3(1,3);

x4p = out.v4(1,1);
y4p = out.v4(1,2);
z4p = out.v4(1,3);

x0p = out.leader(1,1);
y0p = out.leader(1,2);
z0p = out.leader(1,3);

x1 = x1p;
y1 = y1p;
z1 = z1p;

x2 = x2p;
y2 = y2p;
z2 = z2p;

x3 = x3p;
y3 = y3p;
z3 = z3p;

x4 = x4p;
y4 = y4p;
z4 = z4p;

x0 = x0p;
y0 = y0p;
z0 = z0p;

p1 = plot3(x1p, y1p, z1p, 'o', 'color', cool(1, :));
hold on
p1line = plot3(x1, y1, z1, 'Linewidth', 1.5, 'color', cool(1, :));

p2 = plot3(x2p, y2p, z2p, 'o', 'color', cool(2, :));
p2line = plot3(x2, y2, z2, 'Linewidth', 1.5, 'color', cool(2, :));

p3 = plot3(x3p, y3p, z3p, 'o', 'color', cool(3, :));
p3line = plot3(x3, y3, z3, 'Linewidth', 1.5, 'color', cool(3, :));

p4 = plot3(x4p, y4p, z4p, 'o', 'color', cool(4, :));
p4line = plot3(x4, y4, z4, 'Linewidth', 1.5, 'color', cool(4, :));

p0 = plot3(x0p, y0p, z0p, 'o', 'color', cool(5, :));
p0line = plot3(x0, y0, z0, 'Linewidth', 1.5, 'color', cool(5, :));

xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
zlabel('$z[\mathrm{m}]$','interpreter','LaTeX')
title('静止系下的飞行器轨迹')
axis([-1,15,-15.48700610255775,1,-0.5,2.5])
view(-37.5,30)
legend([p1line,p2line,p3line,p4line,p0line],'飞行器1轨迹','飞行器2轨迹','飞行器3轨迹','飞行器4轨迹','移动目标轨迹','interpreter','LaTeX','Location','south')
for k = 1:200
    x1p = out.v1(1+k*10, 1);
    y1p = out.v1(1+k*10, 2);
    z1p = out.v1(1+k*10, 3);
    
    x2p = out.v2(1+k*10, 1);
    y2p = out.v2(1+k*10, 2);
    z2p = out.v2(1+k*10, 3);
    
    x3p = out.v3(1+k*10, 1);
    y3p = out.v3(1+k*10, 2);
    z3p = out.v3(1+k*10, 3);
    
    x4p = out.v4(1+k*10, 1);
    y4p = out.v4(1+k*10, 2);
    z4p = out.v4(1+k*10, 3);

    x0p = out.leader(1+k*10, 1);
    y0p = out.leader(1+k*10, 2);
    z0p = out.leader(1+k*10, 3);

    x1(1+k) = x1p;
    y1(1+k) = y1p;
    z1(1+k) = z1p;
    
    x2(1+k) = x2p;
    y2(1+k) = y2p;
    z2(1+k) = z2p;
    
    x3(1+k) = x3p;
    y3(1+k) = y3p;
    z3(1+k) = z3p;
    
    x4(1+k) = x4p;
    y4(1+k) = y4p;
    z4(1+k) = z4p;


    x0(1+k) = x0p;
    y0(1+k) = y0p;
    z0(1+k) = z0p;

    set(p0, 'XData', x0p, 'YData', y0p, 'ZData', z0p);
    set(p1, 'XData', x1p, 'YData', y1p, 'ZData', z1p);
    set(p2, 'XData', x2p, 'YData', y2p, 'ZData', z2p);
    set(p3, 'XData', x3p, 'YData', y3p, 'ZData', z3p);
    set(p4, 'XData', x4p, 'YData', y4p, 'ZData', z4p);
    set(p0line, 'XData', x0, 'YData', y0, 'ZData', z0);
    set(p1line, 'XData', x1, 'YData', y1, 'ZData', z1);
    set(p2line, 'XData', x2, 'YData', y2, 'ZData', z2);
    set(p3line, 'XData', x3, 'YData', y3, 'ZData', z3);
    set(p4line, 'XData', x4, 'YData', y4, 'ZData', z4);

    drawnow;
    f=getframe(gcf);
    imind=frame2im(f);
    [imind,cm]=rgb2ind(imind,32);
    if k==1
        imwrite(imind,cm,'3Dic.gif','GIF','Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(imind,cm,'3Dic.gif','GIF','WriteMode','append','DelayTime',0.1);
    end
end    
%% 3Dp
close all
cool=get(gca,'colororder');
figure(1)

x1p = out.v1(1,4);
y1p = out.v1(1,5);
z1p = out.v1(1,6);

x2p = out.v2(1,4);
y2p = out.v2(1,5);
z2p = out.v2(1,6);

x3p = out.v3(1,4);
y3p = out.v3(1,5);
z3p = out.v3(1,6);

x4p = out.v4(1,4);
y4p = out.v4(1,5);
z4p = out.v4(1,6);


x1 = x1p;
y1 = y1p;
z1 = z1p;

x2 = x2p;
y2 = y2p;
z2 = z2p;

x3 = x3p;
y3 = y3p;
z3 = z3p;

x4 = x4p;
y4 = y4p;
z4 = z4p;


p1 = plot3(x1p, y1p, z1p, 'o', 'color', cool(1, :));
hold on
p1line = plot3(x1, y1, z1, 'Linewidth', 1.5, 'color', cool(1, :));

p2 = plot3(x2p, y2p, z2p, 'o', 'color', cool(2, :));
p2line = plot3(x2, y2, z2, 'Linewidth', 1.5, 'color', cool(2, :));

p3 = plot3(x3p, y3p, z3p, 'o', 'color', cool(3, :));
p3line = plot3(x3, y3, z3, 'Linewidth', 1.5, 'color', cool(3, :));

p4 = plot3(x4p, y4p, z4p, 'o', 'color', cool(4, :));
p4line = plot3(x4, y4, z4, 'Linewidth', 1.5, 'color', cool(4, :));

xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
zlabel('$z[\mathrm{m}]$','interpreter','LaTeX')
title('\textbf{Aircraft Paths in $\{ P \}$}','interpreter','LaTeX')
axis([-2.042253976936348,2.02033978112074,-1.030657582735243,2,-1.5,1.5])
view(-37.5,30)
legend([p1line,p2line,p3line,p4line],'Aircraft 1 path','Aircraft 2 path','Aircraft 3 path','Aircraft 4 path','interpreter','LaTeX','Location','northwest')
for k = 1:200
    x1p = out.v1(1+k*10, 4);
    y1p = out.v1(1+k*10, 5);
    z1p = out.v1(1+k*10, 6);
    
    x2p = out.v2(1+k*10, 4);
    y2p = out.v2(1+k*10, 5);
    z2p = out.v2(1+k*10, 6);
    
    x3p = out.v3(1+k*10, 4);
    y3p = out.v3(1+k*10, 5);
    z3p = out.v3(1+k*10, 6);
    
    x4p = out.v4(1+k*10, 4);
    y4p = out.v4(1+k*10, 5);
    z4p = out.v4(1+k*10, 6);


    x1(1+k) = x1p;
    y1(1+k) = y1p;
    z1(1+k) = z1p;
    
    x2(1+k) = x2p;
    y2(1+k) = y2p;
    z2(1+k) = z2p;
    
    x3(1+k) = x3p;
    y3(1+k) = y3p;
    z3(1+k) = z3p;
    
    x4(1+k) = x4p;
    y4(1+k) = y4p;
    z4(1+k) = z4p;


    set(p1, 'XData', x1p, 'YData', y1p, 'ZData', z1p);
    set(p2, 'XData', x2p, 'YData', y2p, 'ZData', z2p);
    set(p3, 'XData', x3p, 'YData', y3p, 'ZData', z3p);
    set(p4, 'XData', x4p, 'YData', y4p, 'ZData', z4p);
    set(p1line, 'XData', x1, 'YData', y1, 'ZData', z1);
    set(p2line, 'XData', x2, 'YData', y2, 'ZData', z2);
    set(p3line, 'XData', x3, 'YData', y3, 'ZData', z3);
    set(p4line, 'XData', x4, 'YData', y4, 'ZData', z4);

    drawnow;
    f=getframe(gcf);
    imind=frame2im(f);
    [imind,cm]=rgb2ind(imind,32);
    if k==1
        imwrite(imind,cm,'3Dp.gif','GIF','Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(imind,cm,'3Dp.gif','GIF','WriteMode','append','DelayTime',0.1);
    end
end    
%% 3Dpc
close all
cool=get(gca,'colororder');
figure(1)

x1p = out.v1(1,4);
y1p = out.v1(1,5);
z1p = out.v1(1,6);

x2p = out.v2(1,4);
y2p = out.v2(1,5);
z2p = out.v2(1,6);

x3p = out.v3(1,4);
y3p = out.v3(1,5);
z3p = out.v3(1,6);

x4p = out.v4(1,4);
y4p = out.v4(1,5);
z4p = out.v4(1,6);


x1 = x1p;
y1 = y1p;
z1 = z1p;

x2 = x2p;
y2 = y2p;
z2 = z2p;

x3 = x3p;
y3 = y3p;
z3 = z3p;

x4 = x4p;
y4 = y4p;
z4 = z4p;


p1 = plot3(x1p, y1p, z1p, 'o', 'color', cool(1, :));
hold on
p1line = plot3(x1, y1, z1, 'Linewidth', 1.5, 'color', cool(1, :));

p2 = plot3(x2p, y2p, z2p, 'o', 'color', cool(2, :));
p2line = plot3(x2, y2, z2, 'Linewidth', 1.5, 'color', cool(2, :));

p3 = plot3(x3p, y3p, z3p, 'o', 'color', cool(3, :));
p3line = plot3(x3, y3, z3, 'Linewidth', 1.5, 'color', cool(3, :));

p4 = plot3(x4p, y4p, z4p, 'o', 'color', cool(4, :));
p4line = plot3(x4, y4, z4, 'Linewidth', 1.5, 'color', cool(4, :));

xlabel('$x[\mathrm{m}]$','interpreter','LaTeX')
ylabel('$y[\mathrm{m}]$','interpreter','LaTeX')
zlabel('$z[\mathrm{m}]$','interpreter','LaTeX')
title('移动系下飞行器轨迹')
axis([-2.042253976936348,2.02033978112074,-1.030657582735243,2,-1.5,1.5])
view(-37.5,30)
legend([p1line,p2line,p3line,p4line],'飞行器1轨迹','飞行器2轨迹','飞行器3轨迹','飞行器4轨迹','interpreter','LaTeX','Location','northwest')
for k = 1:200
    x1p = out.v1(1+k*10, 4);
    y1p = out.v1(1+k*10, 5);
    z1p = out.v1(1+k*10, 6);
    
    x2p = out.v2(1+k*10, 4);
    y2p = out.v2(1+k*10, 5);
    z2p = out.v2(1+k*10, 6);
    
    x3p = out.v3(1+k*10, 4);
    y3p = out.v3(1+k*10, 5);
    z3p = out.v3(1+k*10, 6);
    
    x4p = out.v4(1+k*10, 4);
    y4p = out.v4(1+k*10, 5);
    z4p = out.v4(1+k*10, 6);


    x1(1+k) = x1p;
    y1(1+k) = y1p;
    z1(1+k) = z1p;
    
    x2(1+k) = x2p;
    y2(1+k) = y2p;
    z2(1+k) = z2p;
    
    x3(1+k) = x3p;
    y3(1+k) = y3p;
    z3(1+k) = z3p;
    
    x4(1+k) = x4p;
    y4(1+k) = y4p;
    z4(1+k) = z4p;


    set(p1, 'XData', x1p, 'YData', y1p, 'ZData', z1p);
    set(p2, 'XData', x2p, 'YData', y2p, 'ZData', z2p);
    set(p3, 'XData', x3p, 'YData', y3p, 'ZData', z3p);
    set(p4, 'XData', x4p, 'YData', y4p, 'ZData', z4p);
    set(p1line, 'XData', x1, 'YData', y1, 'ZData', z1);
    set(p2line, 'XData', x2, 'YData', y2, 'ZData', z2);
    set(p3line, 'XData', x3, 'YData', y3, 'ZData', z3);
    set(p4line, 'XData', x4, 'YData', y4, 'ZData', z4);

    drawnow;
    f=getframe(gcf);
    imind=frame2im(f);
    [imind,cm]=rgb2ind(imind,32);
    if k==1
        imwrite(imind,cm,'3Dpc.gif','GIF','Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(imind,cm,'3Dpc.gif','GIF','WriteMode','append','DelayTime',0.1);
    end
end    