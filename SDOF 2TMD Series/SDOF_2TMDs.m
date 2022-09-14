% SDOF 2 parallel TMDs
% Mehmet Furkan Doğan
% 10.08.22
clear;clc;close all;
%%
sTMD = [    0.05 0.1 0.1 0.01 0.1];
% Mass
m2 = sTMD(1);
m3 = 0.1 - m2;
% Stiffness
k2 = sTMD(2);
k3 = sTMD(3);
% Damping Coefficient
c2 = sTMD(4);
c3 = sTMD(5);
%%
w = Undamped_Freq(m2,k2,k3);
% disp(w);
p = peak_TMD(m2,k2,k3,c2,c3);
% disp(p);
init_plot
plot_TMD(m2,k2,k3,c2,c3);

plot([w(1) w(1)],[.1 5],'k--');
plot([w(2) w(2)],[.1 5],'k--');
plot([w(3) w(3)],[.1 5],'k--');
plot([0.7 10],[p p],'r--');
% ylim([0 5]);
%%
% m2 = 0.01:0.01:0.05;
% k2 = 0.1:0.1:1;
% k3 = 0.1:0.1:1;
% c2 = 0.01;
% c3 = 0.01;
% p = 100;
% pmin = 100;
% for i1 = 1:size(m2,2)
%     for i2 = 1:size(k2,2)
%         for i3 = 1:size(k3,2)
%             for i4 = 1:size(c2,2)
%                 for i5 = 1:size(c3,2)
%                     p = peak_TMD(m2(i1),k2(i2),k3(i3),c2(i4),c3(i5));
%                     if(p<pmin)
%                         pmin = p;
%                         fprintf('%.4f\t\t%.4f\t%.4f\t%.4f\t%.4f\t%.4f\n',pmin,m2(i1),k2(i2),k3(i3),c2(i4),c3(i5));
%                     end
%                 end
%             end
%         end
%     end
% end
