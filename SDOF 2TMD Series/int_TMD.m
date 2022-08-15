function I = int_TMD(m2,k2,k3,c2,c3)
    %%
    w1 = 0.7;
    w2 = 1.3;
    winc = 0.001;
    w = w1:winc:w2;
    clear w1 winc w2;
    %%
    x1 = zeros(size(w));
    for iter = 1:size(w,2)
        x1(iter) = solve_TMD2(m2,k2,k3,c2,c3,w(iter));
    end
    I = trapz(w,x1);
end