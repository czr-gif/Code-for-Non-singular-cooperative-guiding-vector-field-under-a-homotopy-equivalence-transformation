function dydt = nhmpf(t, y,vd,wd,v)
    global err ind
    k_1 = 1;k_2 = 1;k_omega = 1;
    % 从 y 中提取状态变量
    Ixd = y(1);
    Iyd = y(2);
    phid = y(3);
    Ix = y(4);
    Iy = y(5);
    phi = y(6);
    theta = y(7);
    
    Pxy = PRI(phid)*([Ix;Iy]-[Ixd;Iyd]);
    Px = Pxy(1);
    Py = Pxy(2);
    f1 = 2*cos(theta);
    f2 = sin(theta);
    f1p = -2*sin(theta);
    f1pp = -2*cos(theta);
    f2p = cos(theta);
    f2pp = -sin(theta);

    Pchi = [f1p - k_1*(Px - f1);f2p - k_2*(Py - f2);1+k_1*(Px-f1)*f1p+k_2*(Py-f2)*f2p];
    Ichi = [vd*cos(phid);vd*sin(phid);0] - [IRP(phid)*S(wd) [0;0];[0 0] 0]*[Px;Py;0]+[IRP(phid) [0;0];[0 0] 1]*Pchi;
    norm = sqrt(Ichi(1)^2+Ichi(2)^2);
    dtheta = (v*Ichi(3))/norm;
    g = 1/norm*[Ichi(1);Ichi(2)];
    h = [cos(phi);sin(phi)];
    
    dotPxy = S(wd)*[Px;Py]+PRI(phid)*(v*h-vd*[cos(phid);sin(phid)]);
    dotPchig = [-k_1 0 f1pp+k_1*f1p;0 -k_2 f2pp+k_2*f2p]*[dotPxy;dtheta];
    dotIchi12 = wd*vd*[-sin(phid);cos(phid)]-wd*(v*h-vd*[cos(phid);sin(phid)])+IRP(phid)*S(wd)'*[Pchi(1);Pchi(2)]+IRP(phid)*dotPchig;
    phigdot = (1/norm^2)*[-Ichi(2) Ichi(1)]*dotIchi12;

    w = phigdot - k_omega *g'*S(1)*h;
    
    dx1dt = vd*cos(phid);
    dx2dt = vd*sin(phid);
    dx3dt = wd;
    dx4dt = v*cos(phi);
    dx5dt = v*sin(phi);
    dx6dt = w;
    dx7dt = dtheta;
    % 将状态变量的导数组合成一个向量
    dydt = [dx1dt; dx2dt; dx3dt; dx4dt; dx5dt; dx6dt;dx7dt];
    err(:,ind) = g-h;
%     pfe(ind) = (Px/2)^2+Py^2-1;
    ind = ind+1;
end