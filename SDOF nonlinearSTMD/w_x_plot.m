clear;home;close all;
%%
k2c = 0.000836;
c2 = 0.05293;
p = nlTMD_peak(k2c,c2);
disp(p);
%%
% fun = @(x) nlTMD_peak(x(1),x(2));
% lb = [0 0];
% ub = [1 0.1];
% [x0, po, ~, ~] = ga(fun,2,[],[],[],[],lb,ub);
% disp(po);
%%
% x0 = [0.0008 0.045];
% lb = [0 0];
% ub = [Inf Inf];
% fun = @(x) nlTMD_peak(x(1),x(2));
% [x, po, exitflag, output] = fmincon(fun,x0,[],[],[],[],lb,ub);
% k2c = x(1);
% c2 = x(2);
% disp(po);
%%
% w = 0.7:0.01:1.2;
% a = zeros(size(w));
% for i = 1:size(w,2)
%     a(i) = nlTMDamp(w(i),k2c,c2);
% end
% figure
% plot(w,a,'--o','LineWidth',1.5,'Color',[0.5 0.5 0.5],'MarkerFaceColor',[0 0 0]);
% grid on
% xlabel('w (rad/s)');ylabel('|x_1| (m)');
%%
% k2c = 10.^(-4:0.1:-1);
% c2 = 10.^(-4:0.1:-1);
% p = zeros(size(k2c,2),size(c2,2));
% iter = 0;
% for i = 1:size(k2c,2)
%     for j = 1:size(c2,2)
%         iter=iter+1;
%         home
%         fprintf('%.4f\t%.4f\t\t%.4f%%\n',k2c(i),c2(j),100*iter/(size(k2c,2)*size(c2,2)));
%         p(i,j) = nlTMD_peak(k2c(i),c2(j));
%     end
% end
%%
fc = figure('name','Damping and Stiffness Variation','numberTitle','off');
load('peak.mat');
surf(k2c,c2,p,'EdgeColor','none','FaceColor','flat');
view(2)
colorbar
xlabel('k_{2c}');
ylabel('c_2');
set(gca, 'XScale', 'log');                  % Logarithmic x scale
set(gca, 'YScale', 'log');                  % Logarithmic y scale