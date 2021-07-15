% Function for the elbow to go up 
function goup(elbow, mytouch3)  
elbow.Speed = -35;
start(elbow)
while(readTouch(mytouch3) ~= 1)
    continue
end
elbow.Speed = 0;
pause(2)
end
