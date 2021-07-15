% Position C to A

function scenario_c2a(base,elbow,mytouch3,L1,L2,L3,L4)
% A coordinate
X =  0;
Y =  -117.9;
Z = 120 - 70; % table height = 70

% Inverse kinematics
theta_1 = 90 + atand(Y/X);
theta_2 = 45  + asind((Z - L1 -( L2 * sind(45) )+ L4  - 70) / L3) + 5; % adding 5 for backlash error of robot 3

% Multiplying with gear ratios
base2a = -((theta_1 +10)* 3); % adding 10 for backlash error of robot 3
elbow2a = theta_2 * 5;

% Elbow motion
elbow.Speed = -35;
start(elbow)
while(readTouch(mytouch3) ~= 1)
    continue
end
elbow.Speed = 0;

% Pidbase variables initialization
err_sum = 0;
prv_err = 0;

% Base motion
while(readRotation(base) < base2a)
     pidspeed = pidbase(round(readRotation(base)), base2a, err_sum,prv_err);  
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

% Initializing pidelbow parameters
err_sum = 0;
prv_err = 0;

% Elbow motion
while(readRotation(elbow) < elbow2a)
    pidspeed = pidbase(round(readRotation(elbow)), elbow2a, err_sum,prv_err);  
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


