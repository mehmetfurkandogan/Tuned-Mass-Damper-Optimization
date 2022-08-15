% Function that plots TMD solution
function plot_TMD(m2,k2,k3,c2,c3)
    w1 = 0.7;
    w2 = 1.3;
    winc = 0.001;
    w = w1:winc:w2;
    %%
    x1 = zeros(size(w));
    for iter = 1:size(w,2)
        x1(iter) = solve_TMD2(m2,k2,k3,c2,c3,w(iter));
    end
    %%
    plot(w,x1,'LineWidth',1.5);
    xlim([w1 w2]);
    % set(gca, 'YScale', 'log');                  % Logarithmic y scale
end

