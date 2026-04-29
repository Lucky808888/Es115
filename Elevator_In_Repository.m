clear; clc; close all;

%% Parameters
t = 0:0.01:15;      % Seconds
a_max = 1.2;        % Max acceleration (m/s^2)
v_constant = 3.5;     % Max velocity (m/s)
t1 = v_constant / a_max; % Time until top speed (2.92s)
t2 = 12;            % Time until braking
t3 = 12 + t1;       % Time stop

%% Function
% three different motions
v = (t < t1) .* (a_max * t) + ...                   % Acceleration
    (t >= t1 & t < t2) .* (v_constant) + ...          % Constant
    (t >= t2 & t < t3) .* (v_constant - a_max*(t-t2)) + ... % Deceleration
    (t >= t3) .* 0;                                 % Stop
% position is just the integral of velocity
y = cumsum(v * 0.01); 
% jerk is the derivative of acceleration, the derivative of velocity
% avoid high sudden jerks
accel = diff(v) ./ 0.01;
jerk = diff(accel) ./ 0.01;
t_jerk = t(1:end-2);

figure('Name', 'Elevator Motion Profile');

% Velocity Plot
subplot(2, 1, 1);
plot(t, v, 'b', 'LineWidth', 2);
grid on;
ylabel('Velocity (m/s)');
title('Elevator Motion Profile: Velocity');

% Position Plot
subplot(2, 1, 2);
plot(t, y, 'g', 'LineWidth', 2);
grid on;
xlabel('Time (s)');
ylabel('Height (m)');
title('Elevator Position (Height)');

% Print Summary
fprintf('Total Height Traveled: %.2f meters\n', y(end));
fprintf('constant Phase Duration: %.2f seconds\n', t2 - t1);