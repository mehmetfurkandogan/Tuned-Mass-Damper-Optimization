function dydt = lTMD(t,y)
    m1 = 1;     % kg
    m2 = 0.1;   % kg
    k1 = 1;     % N/m
    c1 = 0.01;  % N*s/m
    f1 = 1;     % N
    c2 = 0.0345;
    k2 = 0.0822;
    w = 1.2;
    x1d = y(3);
    x2d = y(4);
    v1d = -(c1+c2)/m1*y(3)+c2/m1*y(4)-k1/m1*y(1)-k2/m1*y(1)+k2/m1*y(2)+f1/m1*sin(w*t);
    v2d = c2/m2*y(3)-c2/m2*y(4)+k2/m2*y(1)-k2/m2*y(2);
    dydt = [x1d;
            x2d;
            v1d;
            v2d];