clc; clear; close all;


t = 0:0.2:20;
v = -0.2*(t - 10).^2 + 20;

figure;
plot(t, v, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('Speed vs Time');
grid on;
dt = 0.2;
a = diff(v) / dt;     
t_a = t(1:end-1);    
figure;
plot(t_a, a, 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Acceleration vs Time (Numerical)');
grid on;
[max_v, idx] = max(v);
t_max = t(idx);
fprintf('Maximum speed = %.2f m/s at time t = %.2f s\n', max_v, t_max);

%add on
distance = trapz(t, v);
fprintf('Estimated total distance traveled = %.2f meters\n', distance);

%reflection response: 
%1. The vertex represents the maximum speed of the cart. 
% It's the point where the cart transitions from accelerating 
% to decelerating.
%2. Positive acceleration: cart is speeding up
%Negative acceleration: cart is slowing down
%Zero acceleration: speed is momentarily constant