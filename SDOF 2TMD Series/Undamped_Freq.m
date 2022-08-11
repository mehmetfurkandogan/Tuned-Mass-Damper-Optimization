% Function that finds the resonance frequencies of the undamped system
function w = Undamped_Freq(m2,k2,k3)
    % Mass
    m1 = 1;
    m3 = 0.1 - m2;
    % Stiffness
    k1 = 1;
    %%
    M = [   m1  0   0;
            0   m2  0;
            0   0   m3];
    K = [   k1+k2    -k2        0;
            -k2       k2+k3     -k3;
            0         -k3       k3];
    %%
    w2 = eig(M\K);
    w = real(sqrt(w2));
end