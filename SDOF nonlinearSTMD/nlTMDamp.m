function amp = nlTMDamp(w,k2c,c2)
    tspan = [0 1000];
    y0 = [0 0 0 0].';
    [~,ynl] = ode45(@nlTMD,tspan,y0);
    amp = max(ynl(round(size(ynl,1)*0.99):end,1));
        function dydt = nlTMD(t,y)
            m1 = 1;     % kg
            m2 = 0.1;   % kg
            k1 = 1;     % N/m
            c1 = 0.01;  % N*s/m
            f1 = 1;     % N
            x1d = y(3);
            x2d = y(4);
            v1d = -(c1+c2)/m1*y(3)+c2/m1*y(4)-k1/m1*y(1)-k2c/m1*y(1)^3+k2c/m1*y(2)^3+f1/m1*sin(w*t);
            v2d = c2/m2*y(3)-c2/m2*y(4)+k2c/m2*y(1)^3-k2c/m2*y(2)^3;
            dydt = [x1d;
                    x2d;
                    v1d;
                    v2d];
        end
end