clc;clear;close all;
%%
tspan = [0 1000];
y0 = [6.1764    6.1472   -0.0723   -0.3726].';
[tnl,ynl] = ode45(@nlTMD,tspan,y0);
[tl,yl] = ode45(@lTMD,tspan,y0);
amp = nlTMDamp(0.75,0.0822,0.0345);
disp(amp);
% disp(ynl(end,:));
%% Figure 1
f1 = figure('Name','Time Domain Solution');
subplot(1,2,1)
plot(tnl,ynl(:,1),'k','LineWidth',1);
hold on
plot(tl,yl(:,1),'r','LineWidth',1);
grid on
xlabel('t (s)');ylabel('x (m)');
legend('x_1 (nonlinear)','x_1 (linear)');
f1.Position = [100   247   1200   420];
title('Time Domain Solution');
subplot(1,2,2)
plot(tnl,ynl(:,1),'k','LineWidth',1.5);
hold on
plot(tl,yl(:,1),'r','LineWidth',1.5);
grid on
xlabel('t (s)');ylabel('x (m)');
xlim([tspan(2)*0.98 tspan(2)]);
legend('x_1 (nonlinear)','x_1 (linear)');
title('Steady State')