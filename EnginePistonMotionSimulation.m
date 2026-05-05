clc; clear; close all;

%Variables
r = 0.05;          
l = 0.15;          
omega = 100;       

T = 2*pi / omega;          
t = linspace(0, T, 500);  
theta = omega * t;
x = r*cos(theta) + sqrt(l^2 - (r*sin(theta)).^2);

dt = t(2) - t(1);
v = diff(x) / dt;
t_v = t(1:end-1);

a = diff(v) / dt;
t_a = t_v(1:end-1);

figure;
plot(t, x, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Piston Displacement vs Time');
grid on;
figure;
plot(t_v, v, 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Piston Velocity vs Time');
grid on;

figure;
plot(t_a, a, 'k', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Piston Acceleration vs Time');
grid on;
% positions
[x_max, idx_max] = max(x);
[x_min, idx_min] = min(x);

fprintf('Maximum position = %.4f m at t = %.4f s\n', x_max, t(idx_max));
fprintf('Minimum position = %.4f m at t = %.4f s\n', x_min, t(idx_min));