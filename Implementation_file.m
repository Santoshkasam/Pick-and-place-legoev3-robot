% *IMPLEMENTATION FILE*
% In this file the Pick and Place functions defined in other .m files are
% Implemented sequentially

clear 

% Homing
homing(1)  

% Pick and place operation
% There are three locations A,B,C in the environment 
% The activity of the robot is to perform the following steps
% 1. Pick up the ball from C and place at A. Then wait for 2 seconds
% 2. Pick up the ball from A and place at B. Then wait for 2 seconds
% 3. Pick up the ball from B and place at C. Then wait for 2 seconds
% 4. Return to the home position

pick('C')
place('A')
pick('A')
place('B')
pick('B')
place('C')

% Homing
homing(0)  

% End of the activity %


