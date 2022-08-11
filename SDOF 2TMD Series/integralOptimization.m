% SDOF 2 parallel TMDs Integral Optimization
% Mehmet Furkan Doğan
% 07.08.22
clear;clc;close all;
%%
fun = @(x) int_TMD(x(1),x(2),x(3),x(4),x(5));
%       m2      k2      k3      c2      c3
x0 = [  0.05;    0.05;    0.04;    0.001;   0.01];
A = [   -1  0   0   0   0;
        0   -1  0   0   0;
        0   0   -1  0   0;
        0   0   0   -1  0;
        0   0   0   0   -1];
b = [0 0 0 0 0].';
lb = [0 0 0 0 0].';
ub = [0.1 Inf Inf Inf Inf];
% options = optimoptions('fminunc','Algorithm','quasi-newton');
% options.Display = 'notify-detailed';
[x, fval, exitflag, output] = fmincon(fun,x0,A,b,[],[],lb,ub);
fprintf('Initial Values:\t\t');
disp(x0.');
fprintf('Optimized Values:\t');
disp(x.');
% fprintf("Optimum point:\n");
% fprintf("m2 = %.4f\n",x(1));