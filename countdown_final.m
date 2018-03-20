%% Final project- Engr 114
% * Team name: AGORA
% * Team meambers: Victor Albarran, David Ayala, Olivia Clark, Ryan Gorecki
% * Course: Engr 144- Winter 2018
% * Date: March 18, 2018
% * Description: In this MATLAB were creating the code for the countdown
% for our project. This countdown besides with the arduino code will help
% launch our car into the ramp.
%% command windows
 clc, clear, close all
 
%% Countdown
h = msgbox(' 5');  %this will display the text box and the number that is given
set(h, 'position', [500 300 100 100]); %makes text box bigger
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );  %function that will show the image in this case the box
set( ch, 'FontSize', 70 ); %makes text box bigger
pause(1)       % this function will pause the text box for a second
delete(h)      % This function will close the text box for the countdown
h = msgbox(' 4');   %this will display the text box and the number that is given
set(h, 'position', [500 300 100 100]); %makes text box bigger
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );  %function that will show the image in this case the box
set( ch, 'FontSize', 70 ); %makes text box bigger
pause(1)         % this function will pause the text box for a second
delete(h)   % This function will close the text box for the countdown   
h = msgbox(' 3');   %this will display the text box and the number that is given
set(h, 'position', [500 300 100 100]); %makes text box bigger
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );   %function that will show the image in this case the box
set( ch, 'FontSize', 70 ); %makes text box bigger
pause(1)         % this function will pause the text box for a second
delete(h)   % This function will close the text box for the countdown
close all   % closes all previous windows
h = msgbox(' 2');  %this will display the text box and the number that is given
set(h, 'position', [500 300 100 100]); %makes box bigger
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );  %function that will show the image in this case the box
set( ch, 'FontSize', 70 ); %makes text box bigger
pause(1)         % this function will pause the text box for a second
delete(h)   % This function will close the text box for the countdown
h = msgbox(' 1');  %this will display the text box and the number that is given
set(h, 'position', [500 300 100 100]); %makes test box bigger
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );  %function that will show the image in this case the box
set( ch, 'FontSize', 70 ); %makes text box bigger
pause(1)         % this function will pause the text box for a second
delete(h)   % This function will close the text box for the countdown

s = serial('COM3');
set(s,'BaudRate',9600);
fopen(s);
fprintf(s,'*IDN?') % prints the command window
out = fscanf(s)
fprintf(s,'1')
fclose(s)
delete(s)          % deleates all previous work
clear s     

%%
function testcode
test = timer( ...
    'Period', 1, ... % Period, in seconds
    'TasksToExecute', 5, ... % Number of timer cycles
    'ExecutionMode', 'fixedRate', ... % Execute the callback exclusively by period
    'TimerFcn', {@testfun} ...
    );

start(test);
end

function testfun(timerObj, ~)
disp(timerObj.TasksExecuted);
end

