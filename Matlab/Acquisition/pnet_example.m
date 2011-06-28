%% PNET EXAMPLE
clear; clc;
% Server machine (FPGA)
serverAddress = '192.168.1.234';
portNumber = 30;
NSAMPLES = 1170;
BUFFERSIZE = 9000;
% Creates tcp/ip connection to the specified 'hostname' and port
tcpConn = pnet('tcpconnect',serverAddress,portNumber );
pause(0.1);
% specifies how long read and listen commands blocks before it timeouts.
pnet(tcpConn,'setreadtimeout',0.5);
disp('Connection established')

%% Read 9000 elements at the beginning of connection
flush = pnet(tcpConn,'read',BUFFERSIZE,'uint8');
% Show flushed data
disp(char(flush))
% specifies how long read and listen commands blocks before it timeouts. (30sec)
pnet(tcpConn,'setreadtimeout',0.5);

%% Write commands '0\n\r' to '6\n\r'
% for iComm = 0:6,
%     pnet(tcpConn,'write',uint8([48+iComm 10 13]));
%     % Receive 35+2 characters from FPGA
%     textReceived = uint8(swapbytes(pnet(tcpConn,'read',[37 1],'uint8')));
%     disp(char(textReceived'))
% end

%% Write command to send A-line 'A\n\r'
tic
acqSamples = 100;
for iComm = 1:acqSamples,
    pnet(tcpConn,'write',uint8([65 10 13]));
    % Reads an array of NSAMPLES+1 elements from a connection
    dataReceived = pnet(tcpConn,'read',[NSAMPLES+1 1],'int16');
    plot(dataReceived)
end
elapsedTime = toc;
disp(['Elapsed time: ' datestr(datenum(0,0,0,0,0,elapsedTime),'HH:MM:SS')])
disp(['Elapsed time: ' datestr(datenum(0,0,0,0,0,toc),'HH:MM:SS')])
fprintf('Estimated speed %.2f lines/sec\n',acqSamples/elapsedTime)
% Reads an array of elements from a connection
% reception = uint32(swapbytes(pnet(tcpConn,'read',[3*nombre_echantillon 1],'uint32')));


%% Continuous acquisition 'C\n\r'
pnet(tcpConn,'write',uint8([67 10 13]));
acqSamples = 10000;
tic
for iComm = 1:acqSamples,
    % Reads an array of NSAMPLES+1 elements from a connection
    dataReceived = pnet(tcpConn,'read',[NSAMPLES+1 1],'int16');
    %     plot(dataReceived)
end
elapsedTime = toc;
disp(['Elapsed time: ' datestr(datenum(0,0,0,0,0,elapsedTime),'HH:MM:SS')])
fprintf('Estimated speed: %.2f lines/sec\n',acqSamples/elapsedTime)
 
%% Closes a tcpconnection (send first a 'Q\n\r')
pnet(tcpConn,'write',[uint8(81) uint8(10) uint8(13)]);
% Receive 35+2 characters from FPGA
textReceived = uint8(swapbytes(pnet(tcpConn,'read',[37 1],'uint8')));
disp(char(textReceived'))
% pause(0.1);
pnet(tcpConn,'close')
disp('Connection closed')

% Closes all pnet connections/sockets used in this matlab session.
% pnet('closeall')
 
% EOF

