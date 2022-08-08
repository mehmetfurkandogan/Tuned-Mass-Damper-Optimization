% Function that solves vibration amplitude vector
function x1 = solve_TMD2(c2,k2,w)
    m1 = 1;     % kg
    m2 = 0.1;   % kg
    k1 = 1;     % N/m
    c1 = 0.01;  % N*s/m
    f1 = 1;     % N
    %%
    M = [m1 0; 0  m2];
    F = [f1; 0];
    C = [c1+c2 -c2; -c2 c2];                        % Damping matrix
    K = [k1+k2 -k2; -k2 k2];                        % Stiffness matrix
    X = zeros(2,size(w,2));
    for iter = 1:size(w,2)
        X(:,iter) = abs((-w(iter).^2.*M+1i.*w(iter).*C+K)\F);
    end
    x1 = X(1);
end