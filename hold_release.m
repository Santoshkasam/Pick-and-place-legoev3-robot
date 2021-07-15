function hold_release(grip,swtch)
% Relieves the ball
if(swtch ==1)
    grip.Speed = 25;
    start(grip)
    pause(0.17)   % To stop going to max position
    grip.Speed = 0;
    pause(1)
    swtch = 0;  % Updating the switch value
else
    % Hold the ball
    grip.Speed = -40;
    start(grip)
    pause(0.2)  % To stop going to max position
    grip.Speed = 0;
    resetRotation(grip)  % Resets to 0
    swtch = 1;  % Updating the switch value
end
end
