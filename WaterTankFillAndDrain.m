clc; clear; close all;


t = 0:1:25;
V = zeros(size(t));
fill_idx = (t >= 0 & t <= 10);
drain_idx = (t > 10 & t <= 25);
V(fill_idx) = 5*t(fill_idx) + 20;
V(drain_idx) = -3*(t(drain_idx) - 10) + 70;
figure;
plot(t, V, 'b', 'LineWidth', 2);
xlabel('Time (min)');
ylabel('Volume (liters)');
title('Water Tank Volume vs Time');
grid on;
target = 50;
t_fill_50 = (target - 20) / 5;         
t_drain_50 = (70 - target) / 3 + 10;    
fprintf('Time when V = 50 L (filling phase): %.2f min\n', t_fill_50);
fprintf('Time when V = 50 L (draining phase): %.2f min\n', t_drain_50);
T = table(t', V', 'VariableNames', {'Time_min', 'Volume_L'});
disp(T);
fill_slope = 5;    
drain_slope = -3;  
fprintf('Filling rate = %.2f L/min\n', fill_slope);
fprintf('Draining rate = %.2f L/min\n', drain_slope);

% Optional add on:
V_capped = min(V, 80);
figure;
plot(t, V_capped, 'm', 'LineWidth', 2);
xlabel('Time (min)');
ylabel('Volume (liters)');
title('Volume with Overflow Cap (80 L)');
grid on;

%Reflection Response: 
%1.
%Filling slope (+5 L/min): water is entering the tank → volume 
% increases steadily
%Draining slope (−3 L/min): water is leaving the tank → volume 
% decreases steadily
%2.
%A positive slope means inflow (tank filling)
%A negative slope means outflow (tank draining)
%The magnitude tells you how fast the volume is changing