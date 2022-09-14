% SDOF 2 parallel TMDs Peak Optimization
% Mehmet Furkan Doğan
% 10.08.22
clear;clc;close all;
%%
fun = @(TMDp) peak_TMD(TMDp(1),TMDp(2),TMDp(3),TMDp(4),TMDp(5));
%           m2      k2      k3      c2      c3
TMDp0 = [   0.0505  0.0510  0.0343  0.0139  0.0093];
% TMDp0 = [   0.04    0.05    0.05    0.002   0.01];
% TMDp0 = [   0.04    0.05    0.05    0.001   0.001];
% TMDp0 = [   0.06    0.05    0.02    0.01    0.01];
% TMDp0 = [   0.0173	0.0118	0.0750	0.0021	0.0273];    % ga
% TMDp0 = [   0.0228	0.0156	0.0714	0.0031	0.0245];    % ga
lb = [0.01 0+1e-4 0+1e-4 0+1e-4 0+1e-4].';
ub = [0.09 Inf Inf Inf Inf].';
% [TMDp0, po,exitflag,output] = ga(fun,5,[],[],[],[],lb,ub);

% fprintf('The number of generations is: %d\n', output.generations);
% fprintf('The number of function evaluations is: %d\n', output.funccount);
% fprintf('The best function value found is: %g\n', po);
[TMDp, po, exitflag, output] = fmincon(fun,TMDp0,[],[],[],[],lb,ub);
home;
fprintf('m2 = %.4f kg\n',TMDp(1));
fprintf('m3 = %.4f kg\n',0.1-TMDp(1));
fprintf('k2 = %.4f N/m\n',TMDp(2));
fprintf('k3 = %.4f N/m\n',TMDp(3));
fprintf('c2 = %.4f N*s/m\n',TMDp(4));
fprintf('c3 = %.4f N*s/m\n',TMDp(5));
init_plot();
plot_TMD(TMDp(1),TMDp(2),TMDp(3),TMDp(4),TMDp(5));
ylim([0 5]);