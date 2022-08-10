% Function that solves the vibration amplitude vector
function x1 = solve_TMD2(m2,k2,k3,c2,c3,w)
    % Mass
    m1 = 1;
    m3 = 0.1 - m2;
    % Stiffness
    k1 = 1;
    % Damping Coefficient
    c1 = 0.01;
    % Force
    f1 = 1;
    f2 = 0;
    f3 = 0;
    %%
    M = [   m1  0   0;
            0   m2  0;
            0   0   m3];
    C = [   c1+c2+c3    -c2     -c3;
            -c2         c2      0;
            -c3         0       c3];
    K = [   k1+k2+k3    -k2     -k3;
            -k2         k2      0;
            -k3         0       k3];
    F = [   f1;
            f2;
            f3];
    %%
    X = abs((-w.^2.*M+1i.*w.*C+K)\F);
    x1 = X(1);