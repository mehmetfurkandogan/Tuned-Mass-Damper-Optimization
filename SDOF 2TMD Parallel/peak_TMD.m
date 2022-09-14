% Function that solves the maximum resonance point
function p = peak_TMD(m2,k2,k3,c2,c3)
    fprintf('%.4f\t%.4f\t%.4f\t%.4f\t%.4f\t\t',m2,k2,k3,c2,c3);
    fun = @(w) -solve_TMD2(m2,k2,k3,c2,c3,w);
    wr = Undamped_Freq(m2,k2,k3);
    options = optimoptions('fminunc','Algorithm','quasi-newton');
    options.Display = 'none';
    w = (wr(1)-0.05):0.1:(wr(end)+0.05);
    wp = zeros(size(w));
    xp = zeros(size(w));
    for i = 1:size(w,2)
        [wp(i), xp(i)] = fminunc(fun,w(i),options);
    end
    wpu = unique(round(wp,5));
    xpu = unique(-round(xp,5));
    disp(xpu);
    p = max(xpu);
end

