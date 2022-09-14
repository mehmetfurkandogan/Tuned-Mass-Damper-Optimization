% SDOF 2 parallel TMDs
% Mehmet Furkan Doğan
% 10.08.22
clear;clc;close all;
%%
TMDp = [    0.0505  0.0510  0.0343  0.0139  0.0093];
% TMDp = [    0.0228	0.0156	0.0714	0.0031	0.0245];
% Mass
m2 = TMDp(1);
m3 = 0.1 - m2;
% Stiffness
k2 = TMDp(2);
k3 = TMDp(3);
% Damping Coefficient
c2 = TMDp(4);
c3 = TMDp(5);
%%
w = Undamped_Freq(m2,k2,k3);
% disp(w);
p = peak_TMD(m2,k2,k3,c2,c3);
disp(p);
init_plot
plot_TMD(m2,k2,k3,c2,c3);

plot([w(1) w(1)],[.1 5],'k--');
plot([w(2) w(2)],[.1 5],'k--');
plot([w(3) w(3)],[.1 5],'k--');
plot([0.7 10],[p p],'r--');
ylim([0 5.5]);