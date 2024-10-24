function dydt = nhmpf_60(t, y,v)
%     global err ind
    k1 = 1;k2 = 1;k_omega = 1;
    % 从 y 中提取状态变量
    x1 = y(1);
    x2 = y(2);
    phi = y(3);
    theta = y(4);

    f1 = 2*cos(theta);
    f2 = sin(theta);
    f1p = -2*sin(theta);
    f1pp = -2*cos(theta);
    f2p = cos(theta);
    f2pp = -sin(theta);
    phi1 = x1-f1;
    phi2 = x2-f2;

    chi1 = f1p - k1*phi1;
    chi2 = f2p - k2*phi2;
    chi3 = 1+k1*phi1*f1p+k2*phi2*f2p;
    n = sqrt(chi1^2+chi2^2);
    
    x_dot = v*cos(phi);
    y_dot = v*sin(phi);
    theta_dot = v/n*chi3;

    w = 1/n^2*[-chi2, chi1]*[-k1,0,f1pp+k1*f1p;0,-k2,f2pp+k2*f2p]*[x_dot;y_dot;theta_dot] - k_omega * [chi1/n, chi2/n]*[0 1;-1 0]*[cos(phi);sin(phi)];
    
    dxdt = x_dot;
    dydt = y_dot;
    dphidt = w;
    dthetadt = theta_dot;
    % 将状态变量的导数组合成一个向量
    dydt = [dxdt;dydt;dphidt;dthetadt];
end