% SDOF 2 parallel TMDs Peak Optimization
% Mehmet Furkan Doğan
% 10.08.22
clear;clc;close all;
%%
fun = @(TMDp) peak_TMD(TMDp(1),TMDp(2),TMDp(3),TMDp(4),TMDp(5));
%           m2      k2      k3      c2      c3
TMDp0 = [   0.04    0.05     0.05     0.002   0.01];
options = optimoptions('fminunc','Algorithm','quasi-newton');
options.Display = 'off';
[TMDp, po, exitflag, output] = fminunc(fun,TMDp0,options);
fprintf('m2 = %.4f kg\n',TMDp(1));
fprintf('m3 = %.4f kg\n',0.1-TMDp(1));
fprintf('k2 = %.4f N/m\n',TMDp(2));
fprintf('k3 = %.4f N/m\n',TMDp(3));
fprintf('c2 = %.4f N*s/m\n',TMDp(4));
fprintf('c5 = %.4f N*s/m\n',TMDp(5));
init_plot();
plot_TMD(TMDp(1),TMDp(2),TMDp(3),TMDp(4),TMDp(5));