% SDOF 2 parallel TMDs
% Mehmet Furkan Doğan
% 07.08.22
clear;clc;close all;
%%
% Mass
m2 = 0.0480;
m3 = 0.1 - m2;
% Stiffness
k2 = 0.0561;
k3 = 0.0398;
% Damping Coefficient
c2 = 0.0105;
c3 = 0.0083;
%%
w1 = 0.7;
w2 = 1.4;
winc = 0.001;
w = w1:winc:w2;
clear w1 winc w2;
%%
x1 = zeros(size(w));
for iter = 1:size(w,2)
    x1(iter) = solve_TMD2(m2,k2,k3,c2,c3,w(iter));
end
wru = Undamped_Freq(m2,k2,k3);   % resonance frequencies of the undamped system
p = peak_TMD([m2;k2;k3;c2;c3]);
I = int_TMD([m2;k2;k3;c2;c3]);
fprintf("Peak = %.4f\n",p);
fprintf("Integral = %.4f\n",I);
%% Plotting
figure
hold on;
title('Vibration Amplitude');
xlabel('$\omega(rad/s)$','interpreter','latex');
ylabel('$|x_1|(m)$','interpreter','latex');
plot(w,x1,'LineWidth',1.5);

grid on;
% set(gca, 'YScale', 'log');                  % Logarithmic y scale
%%
% m2 = 0.1;
% m3 = 0.1 - m2;
% % Stiffness
% k2 = 0.0918;
% k3 = 0;
% % Damping Coefficient
% c2 = 0.0243;
% c3 = 0;
% %%
% x1 = zeros(size(w));
% for iter = 1:size(w,2)
%     x1(iter) = solve_TMD2(m2,k2,k3,c2,c3,w(iter));
% end
% plot(w,x1,'LineWidth',1.5);