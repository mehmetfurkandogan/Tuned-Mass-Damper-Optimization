% Single Degree of Freedom Structure with a Single Tuned Mass Damper
% The Effect of Damping and Stiffness Variation
% Mehmet Furkan Doğan
% 01.08.2022
clc;clear;close all;
%% 
w1 = 0.7;
w2 = 1.2;
k2 = 0.1;
c2 = 0.001;
winc = 0.001;  % rad/s
[X,I] = int_TMD(w1,w2,k2,c2, winc);
disp('Integral:');disp(I);
%% Plotting
% Creating the figure
fc = figure('name','Vibration Amplitude','numberTitle','off');
fc.Position = [0   265   560   420];        % Figure window position
% set(gca, 'YScale', 'log');                  % Logarithmic y scale
title('Vibration Amplitude');
xlabel('$\omega(rad/s)$','interpreter','latex');
ylabel('$|x_1|(m)$','interpreter','latex');
xlim([w1 w2]);
hold on;
grid on;
plot(w1:winc:w2,X(1,:),'k','linewidth',1.5);