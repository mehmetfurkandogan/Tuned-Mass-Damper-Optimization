% SDOF 2 parallel TMDs
% Mehmet Furkan Doğan
% 10.08.22
clear;clc;close all;
%%
% Mass
m2 = 0.0505;
m3 = 0.1 - m2;
% Stiffness
k2 = 0.0510;
k3 = 0.0343;
% Damping Coefficient
c2 = 0.0139;
c3 = 0.0093;
%%
init_plot
plot_TMD(m2,k2,k3,c2,c3);