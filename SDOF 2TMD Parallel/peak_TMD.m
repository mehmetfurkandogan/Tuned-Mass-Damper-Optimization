% Function that solves the maximum resonance point
function p = peak_TMD(m2,k2,k3,c2,c3)
    fun = @(w) -abs(solve_TMD2(m2,k2,k3,c2,c3,w));
    options = optimoptions('fminunc','Algorithm','quasi-newton');
    options.Display = 'off';
    wud = Undamped_Freq(m2,k2,k3);  % Undamped frequencies
    x = zeros(size(wud));
    for i = 1:size(wud,1)
        [~, x(i), ~, ~] = fminunc(fun,wud,options);
    end
    p = -min(x);
end

