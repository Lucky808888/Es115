clear; clc; close all;

%Variables
t = 0:0.01:15;     
a_max = 1.2;      
v_cruise = 3.5;     
t1 = v_cruise / a_max; 
t2 = 12;           
t3 = 12 + t1;      

%velocity 
v = (t < t1) .* (a_max * t) + ...                  
    (t >= t1 & t < t2) .* (v_cruise) + ...         
    (t >= t2 & t < t3) .* (v_cruise - a_max*(t-t2)) + ... 
    (t >= t3) .* 0;                                 

y = cumsum(v * 0.01); 

accel = diff(v) ./ 0.01;
jerk = diff(accel) ./ 0.01;
t_jerk = t(1:end-2);


figure('Name', 'Elevator Motion Profile');

subplot(2, 1, 1);
plot(t, v, 'b', 'LineWidth', 2);
grid on;
ylabel('Velocity (m/s)');
title('Elevator Motion Profile: Velocity');

subplot(2, 1, 2);
plot(t, y, 'g', 'LineWidth', 2);
grid on;
xlabel('Time (s)');
ylabel('Height (m)');
title('Elevator Position (Height)');
%display result
fprintf('Total Height Traveled: %.2f meters\n', y(end));
fprintf('Cruise Phase Duration: %.2f seconds\n', t2 - t1);