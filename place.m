% This function manipulates the gripper to reach the given station and
% place the object.

function place(station)

micky = legoev3('usb');
mytouch = touchSensor(micky,1);
mytouch3 = touchSensor(micky,3);
readTouch(mytouch);
readTouch(mytouch3);
elbow = motor(micky,'B');
grip = motor(micky,'A');
base = motor(micky,'C');
L1 = 50;
L2 = 95;
L3 = 185;
L4 = 110;

switch station
    
    case 'A'
        % Motion to place at A
        scenario_c2a(base,elbow,mytouch3,L1,L2,L3,L4)       
        hold_release(grip,1)
        goup(elbow, mytouch3)
       
    case 'B'  
        % Motion to place at B
        scenario_a2b(base,elbow,mytouch3,L1,L2,L3,L4)
        hold_release(grip,1)
        goup(elbow, mytouch3)
    case 'C'
        % Motion to place at C
       scenario_b2c(base,elbow,mytouch3,L1,L2,L3,L4)
       hold_release(grip,1)
       goup(elbow, mytouch3)
      
end
end
