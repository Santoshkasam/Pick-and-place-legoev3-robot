function [pidspeed] = pidelbow(actrot, reqrot, err_sum, prv_err)
kp = 0.01;  % Proportionality constant
ki = 0.5;   % Integral constant
kd = 0.7;  % Derivative constant
Ts = 0.1;  % Time stamp 

err = reqrot - actrot;   % Error of the position

% PID formula
pidspeed = kp * err + ki * err_sum * Ts + kd * ((err - prv_err) / Ts);

% Updating errors to use in next cycle
prv_err = err;
err_sum = err_sum + err;

end