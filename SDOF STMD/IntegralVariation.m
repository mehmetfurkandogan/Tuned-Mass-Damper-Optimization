% Single Degree of Freedom Structure with a Single Tuned Mass Damper
% The Effect of Damping and Stiffness Variation
% It creates a 3d the integral of the vibration amplitude vs. stiffness
% coefficient vs. damping coefficient surface
% Mehmet Furkan Doğan
% 02.08.2022
clc;clear;close all;
%% 
w1 = 0.7;
w2 = 1.2;
winc = 0.001;  % rad/s
k2 = 0.01:0.005:0.2;
c2 = 0.01:0.005:0.2;
I = zeros(size(k2,2),size(c2,2));
for i = 1:size(k2,2)
    for j = 1:size(c2,2)
        I(i,j) = int_TMD2(w1,w2,k2(i),c2(j),winc);
    end
end
%% Plotting
% Creating the figure
fc = figure('name','Damping and Stiffness Variation','numberTitle','off');
% set(gca, 'XScale', 'log');                  % Logarithmic y scale
% set(gca, 'YScale', 'log');                  % Logarithmic y scale
title('Damping and Stiffness Variation');
xlabel('k (N/m)');
ylabel('c (N*s/m)');
zlabel('Area under the curve');
hold on;
grid on;
surf(k2,c2,I,'EdgeColor','black','FaceColor','flat');
view(3)
colorbar