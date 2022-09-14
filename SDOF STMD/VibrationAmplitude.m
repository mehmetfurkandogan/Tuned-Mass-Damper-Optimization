% Single Degree of Freedom Structure with a Single Tuned Mass Damper
% The Effect of Damping and Stiffness Variation
% It creates a 2d amplitude vs frequency plot
% Mehmet Furkan Doğan
% 01.08.2022
clc;clear;close all;
%% 
w1 = 0.7;
w2 = 1.2;
k2 = 0;
c2 = 0;
winc = 0.001;  % rad/s
w01 = w1 + (w2-w1)/4;
w02 = w1 + (w2-w1)*3/4;
wm = (w1+w2)/2;
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
xlim([w1 w2]);ylim([0 110]);
hold on;
grid on;
plot(w1:winc:w2,X(1,:),'k','linewidth',1.5);
% plot([w01],[solve_TMD2(c2,k2,w01)],'ko','LineWidth',1);
% plot([w01 w01],[0 70],'k--','LineWidth',1);
% plot([w02],[solve_TMD2(c2,k2,w02)],'ko','LineWidth',1);
% plot([w02 w02],[0 70],'k--','LineWidth',1);
% plot([wm wm],[0 70],'k--','LineWidth',1);
% set(gca, 'YScale', 'log');                  % Logarithmic y scale