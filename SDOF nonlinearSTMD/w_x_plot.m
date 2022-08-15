clear;home;close all;
%%
k2c = 0.0008;
c2 = 0.0529;
p = nlTMD_peak(k2c,c2);
disp(p);
%%
% x0 = [0.0008 0.045];
% lb = [0 0];
% ub = [Inf Inf];
% fun = @(x) nlTMD_peak(x(1),x(2));
% [x, po, exitflag, output] = fmincon(fun,x0,[],[],[],[],lb,ub);
%%
w = 0.7:0.01:1.2;
a = zeros(size(w));
for i = 1:size(w,2)
    a(i) = nlTMDamp(w(i),k2c,c2);
end
figure
plot(w,a,'-o','LineWidth',1.5,'Color',[0.47,0.67,0.19],'MarkerFaceColor',[0 0 0]);
grid on
xlabel('w (rad/s)');ylabel('|x_1| (m)');