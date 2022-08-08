% Function that solves the maximum resonance point
function y = peak_TMD(x)
    m2 = x(1);
    k2 = x(2);
    k3 = x(3);
    c2 = x(4);
    c3 = x(5);
    fun = @(w) -heaviside(solve_TMD2(m2,k2,k3,c2,c3,w))*...
        solve_TMD2(m2,k2,k3,c2,c3,w);
    options = optimoptions('fminunc','Algorithm','quasi-newton');
    options.Display = 'off';
    wud = Undamped_Freq(m2,k2,k3);  % Undamped frequencies
    x1 = zeros(size(wud));
    for i = 1:size(wud,1)
        [~, x1(i), ~, ~] = fminunc(fun,wud,options);
    end
    y = -min(x1);
end

