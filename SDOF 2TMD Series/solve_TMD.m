% Function that solves vibration amplitude vector
function X = solve_TMD(M,F,C,K,w)
    X = abs((-w.^2.*M+1i.*w.*C+K)\F);
end