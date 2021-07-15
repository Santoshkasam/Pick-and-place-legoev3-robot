% position A to B

function scenario_a2b(base,elbow,mytouch3,L1,L2,L3,L4)
% B coordinates
X = 117.9;
Y = 0;
Z = 120;

% Inverse Kinematic equations
theta_1 = 90 + atand(Y/X);
theta_2 = 45  + asind((Z - L1 -( L2 * sind(45) )+ L4  - 70) / L3) + 5;  % adding 5 for backlash error of robot 3

% Gear ratio
base2b = -(theta_1 + 10)* 3;  % adding 10 for backlash error of robot 3 
elbow2b = theta_2 * 5;
elbow.Speed = -35;
start(elbow)
while(readTouch(mytouch3) ~= 1)
    continue
end
elbow.Speed = 0;

% PID control for base 
err_sum = 0; % Total error
prv_err = 0; % Previous error

while(readRotation(base) > base2b)
   pidspeed = pidbase(round(readRotation(base)), base2b, err_sum,prv_err);
   
   % Setting saturation limits
   if (pidspeed >= 25)
       base.Speed = 25;
   elseif (pidspeed <= -25)
       base.Speed = -25;
   else
       base.Speed = pidspeed;
   end
end
base.Speed = 0;
pause(0.2)

% PID control for elbow
err_sum = 0;
prv_err = 0;

while(readRotation(elbow) < elbow2b)
   pidspeed = pidbase(round(readRotation(elbow)), elbow2b, err_sum,prv_err); 
   
   % Setting saturation limits
   if (pidspeed >= 25)
       elbow.Speed = 25;
   elseif (pidspeed <= -25)
       elbow.Speed = -35;
   else
       elbow.Speed = pidspeed;
   end
end

elbow.Speed = 0;

end
