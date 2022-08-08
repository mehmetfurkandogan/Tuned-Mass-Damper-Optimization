% Function that solves the maximum resonance point at the given frequency
% interval
function p = peak_TMD(w1,w2,k2,c2)
    fun = @(x) -solve_TMD2(c2,k2,x);
    options = optimoptions('fminunc','Algorithm','quasi-newton');
    options.Display = 'iter';
    x01 = w1 + (w2-w1)/4;
    [~, fval1, ~, ~] = fminunc(fun,x01,options);
    x02 = w1 + (w2-w1)*3/4;
    [~, fval2, ~, ~] = fminunc(fun,x02,options);
    p = max(abs(fval1),abs(fval2));
end