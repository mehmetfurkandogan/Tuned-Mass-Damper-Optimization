% SDOF 2 parallel TMDs
% Mehmet Furkan Doğan
% 10.08.22
clear;clc;close all;
%%
% Mass
m2 = 0.0589;
m3 = 0.1 - m2;
% Stiffness
k2 = 0.0899;
k3 = 1.0934e+06;
% Damping Coefficient
c2 = 0.0288;
c3 = 2.5269e+05;
%%
init_plot
plot_TMD(m2,k2,k3,c2,c3);