% Function that solves the maximum resonance point
function p = peak_TMD(m2,k2,k3,c2,c3)
    fun = @(w) -solve_TMD2(m2,k2,k3,c2,c3,w);
    wru = Undamped_Freq(m2,k2,k3);
    options = optimoptions('fminunc','Algorithm','quasi-newton');
    options.Display = 'off';
    wp = zeros(size(wru));
    xp = zeros(size(wru));
    for i = 1:size(wru,1)
        [wp(i), xp(i), ~, ~] = fminunc(fun,wru(i),options);
    end
    p = max(-xp);
end

