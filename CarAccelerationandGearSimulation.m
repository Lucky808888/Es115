clc; clear; close all;

t = 0:0.1:15;
a = zeros(size(t));

%gear values
a1 = 3;   % Gear 1
a2 = 2;   % Gear 2
a3 = 1;   % Gear 3

%shift intervals
gear1 = (t >= 0 & t < 5);
gear2 = (t >= 5 & t < 10);
gear3 = (t >= 10 & t <= 15);

a(gear1) = a1;
a(gear2) = a2;
a(gear3) = a3;

v = zeros(size(t));
dt = t(2) - t(1);

for i = 2:length(t)
    v(i) = v(i-1) + a(i)*dt;
end

% Plot 
figure;
plot(t, v, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Car Velocity vs Time (Gear Simulation)');
grid on;

figure;
plot(t, a, 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Acceleration vs Time (Gear Shifts)');
grid on;

% Final speed
fprintf('Final velocity at t = 15 s: %.2f m/s\n', v(end));