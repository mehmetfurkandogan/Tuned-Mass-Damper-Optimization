% Function that initialize the plots of TMD solutions
function init_plot()
    f = figure('name','TMD Optimization','numberTitle','off');
    hold on;grid on;
    title('Vibration Amplitude');
    xlabel('$\omega(rad/s)$','interpreter','latex');
    ylabel('$|x_1|(m)$','interpreter','latex');
end

