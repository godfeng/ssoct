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
pnet(tcpConn,'setreadtimeout',0.25);
pnet(tcpConn,'setwritetimeout',0.1);
fprintf('Connection established to %s at port %d\n',serverAddress,portNumber)

%% Read elements at the beginning of connection to flush buffer
flush = pnet(tcpConn,'read',BUFFERSIZE,'uint8');
% Show flushed data
disp(char(flush))

%% Write commands '0\n\r' to '6\n\r'
for iComm = 0:6,
    pnet(tcpConn,'write',uint8([48+iComm 10 13]));
    % Receive 35+2 characters from FPGA
    textReceived = uint8(swapbytes(pnet(tcpConn,'read',[37 1],'uint8')));
    disp(char(textReceived'))
end

%% Write command to acquire single A-line 'A\n\r'
tic
nLinesPerFrame = 100;
nFrames = 1;
nAcqSamples = nLinesPerFrame*nFrames;
rawData = zeros([NSAMPLES nLinesPerFrame nFrames],'int16');
fprintf('Acquiring %d A-lines, one by one...\n',nAcqSamples)
for iFrames = 1:nFrames,
    for iLines = 1:nLinesPerFrame,
        pnet(tcpConn,'write',uint8([65 10 13]));
        % Reads an array of NSAMPLES elements from a connection
        rawData(:,iLines,iFrames) = pnet(tcpConn,'read',[NSAMPLES 1],'int16');
    end
end
elapsedTime = toc;
disp(['Elapsed time: ' datestr(datenum(0,0,0,0,0,elapsedTime),'HH:MM:SS')])
fprintf('Estimated speed %.2f lines/sec\n',nAcqSamples/elapsedTime)

%% Display previously acquired data
figure
for iFrames = 1:size(rawData,3),
    for iLines = 1:size(rawData,2),
        plot(squeeze(rawData(:,iLines,iFrames)))
        ylim([0 2^14])
        title(sprintf('Slow Transfer. Frame %d. Line %d',iFrames,iLines))
        pause(0.01);
    end
end


%% Continuous acquisition 'C\n\r'
% Works fine!!!
nLinesPerFrame = 800;
nFrames = 100;
nAcqSamples = nLinesPerFrame*nFrames;
rawDataCont = zeros([NSAMPLES nLinesPerFrame],'int16');
fprintf('Continuous acquisition of %d A-lines...\n',nAcqSamples)
figure
pnet(tcpConn,'write',uint8([67 10 13]));
tic
for iFrames = 1:nFrames,
    for iLines = 1:nLinesPerFrame,
        % Reads an array of NSAMPLES elements from a connection
        rawDataCont(:,iLines) = pnet(tcpConn,'read',[NSAMPLES 1],'int16');
%         Conditional breakpoint
%         if (iLines == 1) && (iFrames == 2)
%             keyboard
%         end
    end
	% Display a B-scan (single frame)
    imagesc(BmodeScan2struct(rawDataCont));
    axis image;
    colormap(gray(255));
    title(sprintf('Continuous Transfer. Frame %d',iFrames));
end
elapsedTime = toc;
disp(['Elapsed time: ' datestr(datenum(0,0,0,0,0,elapsedTime),'HH:MM:SS')])
fprintf('Estimated speed: %.2f lines/sec\n',nAcqSamples/elapsedTime)
 
%% Display data acquired continuously
figure
ylim([0 2^14])
for iFrames = 1:size(rawDataCont,3),
    for iLines = 1:nLinesPerFrame,
        plot(squeeze(rawDataCont(:,iLines,iFrames)))
        title(sprintf('Continuous Transfer. Frame %d. Line %d',iFrames,iLines))
        pause(0.01)
%         pause()
    end
end

%% Closes a tcpconnection (send first a 'Q\n\r')
pnet(tcpConn,'write',[uint8(81) uint8(10) uint8(13)]);
% Receive 35+2 characters from FPGA
textReceived = uint8(swapbytes(pnet(tcpConn,'read',[37 1],'uint8')));
disp(char(textReceived'))
% pause(0.1);
pnet(tcpConn,'close')
fprintf('Connection closed from %s at port %d\n',serverAddress,portNumber)

% Closes all pnet connections/sockets used in this matlab session.
% pnet('closeall')

% EOF

