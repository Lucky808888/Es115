clc; clear; close all;


t = 0:2:20;   
T = [90 85 80 76 72 69 66 63 61 59 57];  % °C

figure;
plot(t, T, 'b-o', 'LineWidth', 2, 'MarkerSize', 6);
xlabel('Time (min)');
ylabel('Temperature (°C)');
title('Cooling Curve: Temperature vs Time');
grid on;
dt = 2;
dTdt = diff(T) / dt;     
t_rate = t(1:end-1);   
figure;
plot(t_rate, dTdt, 'r-s', 'LineWidth', 2, 'MarkerSize', 6);
xlabel('Time (min)');
ylabel('Rate of Change (°C/min)');
title('Cooling Rate vs Time');
grid on;
exposure = trapz(t, T);
fprintf('Estimated total thermal exposure = %.2f °C·min\n', exposure);

%Optional add on:
Table = table(t', T', 'VariableNames', {'Time_min', 'Temperature_C'});
disp(Table);