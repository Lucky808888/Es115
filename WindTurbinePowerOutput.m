clc; clear; close all;

%Variables
t = 0:0.5:60;   
v = 8 + 3*sin(0.1*t);  
rho = 1.225;  
A = 10;        
Cp = 0.4;      

P = 0.5 * rho * A * Cp * v.^3;
figure;
plot(t, v, 'b', 'LineWidth', 2);
xlabel('Time (min)');
ylabel('Wind Speed (m/s)');
title('Wind Speed vs Time');
grid on;
figure;
plot(t, P, 'r', 'LineWidth', 2);
xlabel('Time (min)');
ylabel('Power Output (W)');
title('Wind Turbine Power Output vs Time');
grid on;
P_avg = mean(P);
fprintf('Average power output = %.2f W\n', P_avg);