% SDOF 2 parallel TMDs Integral Optimization
% Mehmet Furkan Doğan
% 07.08.22
clear;clc;close all;
%%
fun = @(x) int_TMD(x(1),x(2),x(3),x(4),x(5));
%       m2      k2      k3      c2      c3
x0 = [  0.04;    0.05;    0.05;    0.002;   0.01];
A = [   -1  0   0   0   0;
        0   -1  0   0   0;
        0   0   -1  0   0;
        0   0   0   -1  0;
        0   0   0   0   -1];
b = [0 0 0 0 0].';
lb = [0 0 0 0 0].';
ub = [0.1 1 1 1 1];
% options = optimoptions('fminunc','Algorithm','quasi-newton');
% options.Display = 'notify-detailed';
[TMDs, fval, exitflag, output] = fmincon(fun,x0,A,b,[],[],lb,ub);
home
fprintf('m2 = %.4f kg\n',TMDs(1));
fprintf('m3 = %.4f kg\n',0.1-TMDs(1));
fprintf('k2 = %.4f N/m\n',TMDs(2));
fprintf('k3 = %.4f N/m\n',TMDs(3));
fprintf('c2 = %.4f N*s/m\n',TMDs(4));
fprintf('c5 = %.4f N*s/m\n',TMDs(5));
init_plot();
plot_TMD(TMDs(1),TMDs(2),TMDs(3),TMDs(4),TMDs(5));
% fprintf("m2 = %.4f\n",x(1));