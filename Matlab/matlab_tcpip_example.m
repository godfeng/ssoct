% MATLAB example using TCP/IP (matlab_tcpip_example.m)
% This simple code example demonstrates how you can use MATLAB to exchange data 
% with a remote application not developed in MATLAB. This code example is taken
% from a MATLAB Digest technical article written by Edward J. Mayhew from 
% George Mason University.  While HTTP was used as the higher-level protocol in 
% this example, you can use other protocols, as was the case in the project. 
% MATLAB supports TCP/IP using Instrument Control Toolbox.  Requires MATLAB and 
% Instrument Control Toolbox.  
%
% On line 14, substitute "www.EXAMPLE_WEBSITE.com" with an actual website with
% which you wish to communicate.

clc                                     % Clear scren
command = 's';

% Server machine (FPGA)
serverAddress = '192.168.1.234';
portNumber = 30;

% Create TCP/IP object 't'. Specify server machine and port number. 
t = tcpip(serverAddress, portNumber); 

% Set size of receiving buffer, if needed. 
set(t, 'InputBufferSize', 2^16); 

% Open connection to the server. 
fopen(t); 

% Read Welcome message (9 lines)
for i=1:9,
	disp(fscanf(t))
    pause(0.125)
end

% Pause for the communication delay, if needed. 
pause(0.1)

% while (get(t, 'BytesAvailable') > 0)

fprintf('DataReceived = \n')
while ~strcmp(command,'q')              % quits if command equals 'q'
%     command = input('Enter Command: ','s');
    command = getkey;
    % Transmit data to the server (or a request for data from the server). 
    fprintf(t, num2str(command)); 
    disp(fscanf(t))
    pause(0.125)
end

% Closed connection from the FPGA
fprintf(t, 'q'); 

% Disconnect and clean up the server connection. 
% fclose(t); 

% Deletes object t
delete(t); 
clear t 
fprintf('Connection successfully closed\n')
