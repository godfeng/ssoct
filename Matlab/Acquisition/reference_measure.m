function [sampleArm, refArm] = reference_measure
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Raw data matrix
rawData     = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame],'int16');
% Signal from reference arm
refArm      = zeros([SSOctDefaults.NSAMPLES 1]);
% Signal from sample arm
sampleArm   = zeros([SSOctDefaults.NSAMPLES 1]);

% New figure on white background
figure; set(gcf,'color','w')
% Change figure name
set(gcf,'Name','Reference measurements')
% Maximize figure
set(gcf, 'OuterPosition', SSOctDefaults.screenSize);

% Send command 67 ('C\n\r') to the socket server
pnet(SSOctDefaults.tcpConn,'write',uint8([67 10 13]));

% disp('Please block sample arm and press any key when ready...')
subplot(121)
title('Please block sample arm and press any key when ready...')
pause()
title('Acquiring data...')

for iFrames = 1:3,
    for iLines = 1:SSOctDefaults.nLinesPerFrame,
        % Reads an array of NSAMPLES elements from a connection
        rawData(:,iLines) = pnet(SSOctDefaults.tcpConn,'read',[SSOctDefaults.NSAMPLES 1],'int16');
        % Correct first sample (always zero, should know why)
        rawData(1,iLines) = rawData(2,iLines);
    end
end

% Display a B-scan (single frame)
imagesc(BmodeScan2struct(rawData));
axis image;
colormap(gray(255));
title('B-scan from reference arm');

% Average A-lines of reference arm
refArm = mean(rawData,2);

% Display reference arm average
subplot(222);
plot(refArm);

% disp('Please block reference arm and press any key when ready...')
subplot(121)
title('Please block reference arm and press any key when ready...')
pause()
title('Acquiring data...')

for iFrames = 1:3,
    for iLines = 1:SSOctDefaults.nLinesPerFrame,
        % Reads an array of NSAMPLES elements from a connection
        rawData(:,iLines) = pnet(SSOctDefaults.tcpConn,'read',[SSOctDefaults.NSAMPLES 1],'int16');
        % Correct first sample (always zero, should know why)
        rawData(1,iLines) = rawData(2,iLines);
    end
end

% Display a B-scan (single frame)
imagesc(BmodeScan2struct(rawData));
axis image;
colormap(gray(255));
title('B-scan from sample arm');


% Average A-lines of sample arm
sampleArm = mean(rawData,2);

% Display sample arm average
subplot(222);
plot(sampleArm);

% Update global variable
SSOctDefaults.sampleArm = sampleArm;
SSOctDefaults.refArm    = refArm;

