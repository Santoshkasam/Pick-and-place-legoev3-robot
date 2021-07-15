% Position B to C

function scenario_b2c(base,elbow,mytouch3,L1,L2,L3,L4)
% C coordinate
X = 0;
Y = 117.9;
Z = 120;

% Inverse kinematics
theta_1 = 90 + atand(Y/X);
theta_2 = 45  + asind((Z - L1 -( L2 * sind(45) )+ L4  - 70) / L3) + 5;  % Adding 5 for backlash error of robot 3

% Multiplying with gear ratios
base2c = -(theta_1 + 10) * 3;   % Adding 10 for backlash error of robot 3
elbow2c = theta_2 * 5;


% Elbow rotation
elbow.Speed = -35;
start(elbow)
while(readTouch(mytouch3) ~= 1)
    continue
end
elbow.Speed = 0;

% PID control for base 
err_sum = 0;
prv_err = 0;

while(readRotation(base) > base2c)
   pidspeed = pidbase(round(readRotation(base)), base2c, err_sum,prv_err);  
   if (pidspeed >= 25)
       base.Speed = 25;
   elseif (pidspeed <= -25)
       base.Speed = -25;
   else
       base.Speed = pidspeed;
   end
end
base.Speed = 0;
pause(0.5)

% PID control for elbow
err_sum = 0;
prv_err = 0;
while(readRotation(elbow) < elbow2c)
   pidspeed = pidbase(round(readRotation(elbow)), elbow2c, err_sum,prv_err);  
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