clc; clear; close all;

%variab;es
dt = 0.1;                  
a = -6;                    
v0_list = [10 20 30];      

figure; hold on;


for i = 1:length(v0_list)
    
    v0 = v0_list(i);
    t = 0;
    v = v0;
    x = 0;
    t_vals = t;
    v_vals = v;
    x_vals = x;
    
    while v > 0
        v = v + a*dt;          
        if v < 0
            v = 0;          
        end
        x = x + v*dt;         
        
        t = t + dt;
        
        t_vals(end+1) = t;
        v_vals(end+1) = v;
        x_vals(end+1) = x;
    end
    
    % Display plot: Distance vs time
    plot(t_vals, x_vals, 'LineWidth', 2);
    
    % Printing stopping distance
    fprintf('Initial speed = %d m/s → Stopping distance = %.2f m\n', v0, x);
end

xlabel('Time (s)');
ylabel('Distance (m)');
title('Vehicle Stopping Distance for مختلف Initial Speeds');
legend('10 m/s','20 m/s','30 m/s','Location','northwest');
grid on;