% Function for homing
function homing(home)

micky = legoev3('usb');
mytouch = touchSensor(micky,1);
mytouch3 = touchSensor(micky,3);
readTouch(mytouch);
readTouch(mytouch3);
elbow = motor(micky,'B');
grip = motor(micky,'A');
base = motor(micky,'C');
% 1: grip is close , 0: grip is open

% Goes to mytouch, mytouch = 0, 0. position; grip should open
% caliberating elbow
elbow.Speed = -25;
start(elbow)
rot_elbow = readTouch(mytouch3);
while(rot_elbow ~= 1)
    rot_elbow = readTouch(mytouch3);
    continue
end
elbow.Speed = 0;

% Caliberating base
base.Speed = 25;
start(base)
rot_base = readTouch(mytouch);
while(rot_base ~= 1) 
    rot_base = readTouch(mytouch);
    continue
end
base.Speed = 0;

readTouch(mytouch)
readTouch(mytouch3)
resetRotation(base)
resetRotation(elbow)

if (home == 1)
    hold_release(grip,1)
else
    hold_release(grip,0)
    
end
