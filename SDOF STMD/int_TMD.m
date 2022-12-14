% Function that calculates the vibration amplitude and its integral
function [X, I] = int_TMD(w1, w2, k2, c2, winc)
    m1 = 1;     % kg
    m2 = 0.1;   % kg
    k1 = 1;     % N/m
    c1 = 0.01;  % N*s/m
    f1 = 1;     % N
    %%
    w = w1:winc:w2;
    M = [m1 0; 0  m2];
    F = [f1; 0];
    C = [c1+c2 -c2; -c2 c2];                        % Damping matrix
    K = [k1+k2 -k2; -k2 k2];                        % Stiffness matrix
    X = solve_TMD(M,F,C,K,w);                       % Position vector
    I = trapz(w,X(1,:));                            % Area under x1 curve
end