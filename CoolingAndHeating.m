clc; clear; close all;

% variables
t = 0:0.5:30;        
T_env = 25;          
T0 = 90;             


k_values = [0.05 0.1 0.2];
figure; hold on;

for i = 1:length(k_values)
    
    k = k_values(i);  
    T = T_env + (T0 - T_env)*exp(-k*t);
    plot(t, T, 'LineWidth', 2);
end

xlabel('Time (min)');
ylabel('Temperature (°C)');
title('Cooling Curves for Different Cooling Coefficients');
legend('k = 0.05','k = 0.1','k = 0.2','Location','northeast');
grid on;