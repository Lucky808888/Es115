clc; clear; close all;


dt = 0.05;
t = 0:dt:6;

%conditions
v0 = 25;              
a_const = -8;         

v_noABS = zeros(size(t));
v_ABS = zeros(size(t));

v_noABS(1) = v0;
v_ABS(1) = v0;

a_base = -8;
a_amp = 4;  

for i = 2:length(t)
    
    
    v_noABS(i) = v_noABS(i-1) + a_const*dt;
    v_noABS(i) = max(v_noABS(i), 0);
    a_ABS = a_base + a_amp*sin(10*t(i)); 
    v_ABS(i) = v_ABS(i-1) + a_ABS*dt;
    
    if v_ABS(i) < 0
        v_ABS(i) = 0;
    end
end

x_noABS = trapz(t, v_noABS);
x_ABS = trapz(t, v_ABS);
%plot display
figure;
plot(t, v_noABS, 'r', 'LineWidth', 2); hold on;
plot(t, v_ABS, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('ABS vs No ABS: Vehicle Speed Comparison');
legend('No ABS (constant braking)','ABS (modulated braking)');
grid on;
% Display results
fprintf('Stopping distance (No ABS) = %.2f m\n', x_noABS);
fprintf('Stopping distance (ABS) = %.2f m\n', x_ABS);