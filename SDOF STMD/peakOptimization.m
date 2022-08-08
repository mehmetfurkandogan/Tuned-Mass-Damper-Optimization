% Single Degree of Freedom Structure with a Single Tuned Mass Damper
% The Effect of Damping and Stiffness Variation
% Optimizing the parameters using the peak points
% Mehmet Furkan Doğan
% 05.08.2022
clc;clear;close all;
%% Optimization
w1 = 0.7;   % rad/s
w2 = 1.2;   % rad/s
%%
fun = @(x) peak_TMD(w1,w2,x(1),x(2));
x0 = [0.01, 0.01];
options = optimoptions('fminunc','Algorithm','quasi-newton');
options.Display = 'iter';
[x, fval, exitflag, output] = fminunc(fun,x0,options);
home
fprintf('For optimized peak:\n');
fprintf('k2 = %.4f N/m\n',x(1));
fprintf('c2 = %.4f N*s/m\n',x(2));
fprintf('peak = %.4f m\n',fval);
%% Plotting
winc = 0.001;  % rad/s
fc = figure('name','TMD Optimization','numberTitle','off');
hold on; grid on;
k2 = 0.0918;c2 = 0.0243;
[X,I] = int_TMD(w1,w2,k2,c2, winc);
plot(w1:winc:w2,X(1,:),'k','linewidth',1.5);
k2 = 0.0911;c2 = 0.0272;
[X,I] = int_TMD(w1,w2,k2,c2, winc);
plot(w1:winc:w2,X(1,:),'--k','linewidth',1.5);
k2 = 0.0822;c2 = 0.0345;
[X,I] = int_TMD(w1,w2,k2,c2, winc);
plot(w1:winc:w2,X(1,:),'-.k','linewidth',1.5);
% k2 = 0;c2 = 0;
% [X,I] = int_TMD(w1,w2,k2,c2, winc);
% plot(w1:winc:w2,X(1,:),'-b','linewidth',1.5);
legend('Optimized integral (w from 0.7 to 1.2)',...
    'Optimized integral (w from 0.7 to 1.3)','Optimized peak'...
    ,'location','best');
title('Vibration Amplitude');
xlabel('$\omega(rad/s)$','interpreter','latex');
ylabel('$|x_1|(m)$','interpreter','latex');
xlim([w1 w2])
% set(gca, 'YScale', 'log');                  % Logarithmic y scale