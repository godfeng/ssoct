function cont_acq
% Continuously acquires OCT data. Optionally save data to a .dat file. See
% scriptMirrorCharact to map .dat files to memory
% SYNTAX:
% cont_acq
% INPUTS:
% None
% OUTPUTS:
% None
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/09/15

% Modifies values of global variable
global SSOctDefaults

% ----------------------------- New figure -------------------------------------
hContAcq = figure; 
% white background
set(hContAcq,'color','w')
% Change figure name
set(hContAcq,'Name','Continuous Acquisition')
% Maximize figure
set(hContAcq, 'OuterPosition', SSOctDefaults.screenSize);

% ------ Transmit acquisition parameters ['A' nLinesPerFrame nFrames]-----------
pnet(SSOctDefaults.tcpConn,'write',([uint8(65) ...
    typecast(uint32(SSOctDefaults.nLinesPerFrame), 'uint8') ...
    typecast(uint32(SSOctDefaults.nFrames), 'uint8')]));
pause(0.1)                              % Necessary to give time to NIOS

% --------------------- Take reference measurements ----------------------------
dbstop if error                         % Debug (Stop if error)
[~, ~] = reference_measure(hContAcq);


% Send command chain ('C') to the socket server
pnet(SSOctDefaults.tcpConn,'write',uint8(67));
pause(0.1)
fprintf('Continuous acquisition...Press <Ctrl>+<C> to cancel\n')
% load('D:\Edgar\Documents\ssoct\Matlab\reference.mat')

% ------------------------------ Main Loop -------------------------------------
if SSOctDefaults.save2file
    % Close all open files
    fclose('all');
    % Default file name
    fileName = fullfile(SSOctDefaults.dirCurrExp,[datestr(now,'yyyy_mm_dd_HH_MM_SS') '.dat']);
    % Save file name of current experiment in global structure
    SSOctDefaults.CurrExpFileName = fileName;
    % Create binary file
    fid = fopen(fileName, 'w');
    iFrames = 1;
    tic
    while ~exist(fullfile(SSOctDefaults.dirCurrExp,'tostop.txt'),'file')
        [~, rawBscan16, ~] = displayAcqOCT(iFrames,hContAcq);
        iFrames = iFrames + 1;
        % --------------------- Save a B-scan frame ----------------------------
        fwrite(fid, rawBscan16, 'uint16');
    end
    frameRate = iFrames/toc;
    fprintf('Approximate Frame Rate = %.3f fps\n',frameRate)
    fclose(fid);
    disp(['File saved as: ' fileName])
    pause(0.5);
    % Delete file created by LabView
    delete(fullfile(SSOctDefaults.dirCurrExp,'tostop.txt'))
else
    %     Save data in a big variable
    %     SSOctDefaults.OCTfullAcq = zeros([SSOctDefaults.nFrames SSOctDefaults.NSAMPLES ...
    %         SSOctDefaults.nLinesPerFrame]);
    iFrames = 1;
    while ~exist(fullfile(SSOctDefaults.dirCurrExp,'tostop.txt'),'file')
        displayAcqOCT(iFrames,hContAcq);
        iFrames = iFrames + 1;
    end
    disp('Transfer done!')
    % Delete file created by LabView
    pause(0.5);
    delete(fullfile(SSOctDefaults.dirCurrExp,'tostop.txt'))
end
% Disconnect from socket server
disconnect_from_FPGA
% ==============================================================================
% [EOF]
