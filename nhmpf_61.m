function dydt = nhmpf_61(t, y,vd,wd,v)
%     global err ind
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
    phi1 = Px-f1;
    phi2 = Py-f2;

    Pchi = [f1p - k_1*phi1;f2p - k_2*phi2;1+k_1*phi1*f1p+k_2*phi2*f2p];
    TAU = [v*cos(phi)-vd*cos(phid);v*sin(phi)-vd*sin(phid)];
    n = sqrt(Pchi(1)^2+Pchi(2)^2);
    tau = norm(TAU);
    dtheta = (tau*Pchi(3))/n;
    
    h = TAU/n;
    
    dotPxy = PRI(phid)*TAU;
    dotPchig = [-k_1,0,f1pp+k_1*f1p;0,-k_2,f2pp+k_2*f2p]*[dotPxy;dtheta];
    phi_chi_dot = (1/n^2)*[-Pchi(2) Pchi(1)]*dotPchig;
    phi_chi = atan(Pchi(2)/Pchi(1));
    g = [cos(phi_chi+phid);sin(phi_chi+phid)];

    w = (tau^2/(v*(v-vd*cos(phi-phid))))*(phi_chi_dot - k_omega *g'*S(1)'*h);
    
    dx1dt = vd*cos(phid);
    dx2dt = vd*sin(phid);
    dx3dt = wd;
    dx4dt = v*cos(phi);
    dx5dt = v*sin(phi);
    dx6dt = w;
    dx7dt = dtheta;
    % 将状态变量的导数组合成一个向量
    dydt = [dx1dt; dx2dt; dx3dt; dx4dt; dx5dt; dx6dt;dx7dt];
%     err(:,ind) = g-h;
%     pfe(ind) = (Px/2)^2+Py^2-1;
%     ind = ind+1;
end