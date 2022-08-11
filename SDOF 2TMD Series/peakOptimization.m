% SDOF 2 parallel TMDs Peak Optimization
% Mehmet Furkan Doğan
% 10.08.22
clear;clc;close all;
%%
fun = @(TMDs) peak_TMD(TMDs(1),TMDs(2),TMDs(3),TMDs(4),TMDs(5));
%           m2      k2      k3      c2      c3
TMDs0 = [   0.06    0.05     0.02     0.01   0.01];
% options = optimoptions('fminunc','Algorithm','quasi-newton');
% options.Display = 'off';
A = [   -1  0   0   0   0;
        0   -1  0   0   0;
        0   0   -1  0   0;
        0   0   0   -1  0;
        0   0   0   0   -1];
b = [0 0 0 0 0].';
lb = [0 0 0 0 0].';
ub = [0.1 1 1 1 1];
[TMDs, po, exitflag, output] = fmincon(fun,TMDs0,A,b,[],[],lb,ub);
home;
fprintf('m2 = %.4f kg\n',TMDs(1));
fprintf('m3 = %.4f kg\n',0.1-TMDs(1));
fprintf('k2 = %.4f N/m\n',TMDs(2));
fprintf('k3 = %.4f N/m\n',TMDs(3));
fprintf('c2 = %.4f N*s/m\n',TMDs(4));
fprintf('c5 = %.4f N*s/m\n',TMDs(5));
init_plot();
plot_TMD(TMDs(1),TMDs(2),TMDs(3),TMDs(4),TMDs(5));