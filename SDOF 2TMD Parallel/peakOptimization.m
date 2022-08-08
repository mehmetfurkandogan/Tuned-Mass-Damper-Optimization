% SDOF 2 parallel TMDs Peak Optimization
% Mehmet Furkan Doğan
% 07.08.22
clear;clc;close all;
%%
% ObjectiveFunction = @peak_TMD;
% lb = [0 0 0 0 0];
% ub = [0.1 1 1 1 1];
% ConstraintFunction = @ga_constraint;
% nvars = 5;
% rng default % For reproducibility
% [x,fval] = ga(ObjectiveFunction,nvars,[],[],[],[],lb,ub,ConstraintFunction)

fun = @(x) peak_TMD(x);
%       m2      k2      k3      c2      c3
x0 = [  0.5;    0.05;    0.04;    0.01;   0.01];
options = optimoptions('fminunc','Algorithm','quasi-newton');
options.Display = 'notify-detailed';
[x, fval, exitflag, output] = fminunc(fun,x0,options);
fprintf('Initial Values:\t\t');
disp(x0.');
fprintf('Optimized Values:\t');
% disp(x.');
% % fprintf("Optimum point:\n");
% % fprintf("m2 = %.4f\n",x(1));