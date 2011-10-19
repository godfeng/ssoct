function [sampleArm, refArm] = reference_measure(hContAcq)
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Raw data matrix
rawData     = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame],'uint16');
% Signal from reference arm
refArm      = zeros([SSOctDefaults.NSAMPLES 1]);
% Signal from sample arm
sampleArm   = zeros([SSOctDefaults.NSAMPLES 1]);

% % New figure on white background
% figure; set(gcf,'color','w')
% % Change figure name
% set(gcf,'Name','Reference measurements')
% % Maximize figure
% set(gcf, 'OuterPosition', SSOctDefaults.screenSize);

fprintf('Taking reference measurement...Press <Ctrl>+<C> to cancel\n')

subplot(121)
title('Please block sample arm and press any key when ready...')
pause()
% Send command chain ('A\n\r nLinesPerFrame nFrames') to the socket server
pnet(SSOctDefaults.tcpConn,'write',uint8([65 10 13 ...
    typecast(uint16(SSOctDefaults.nLinesPerFrame), 'uint8') ...
    typecast(uint16(SSOctDefaults.nFrames), 'uint8')]));
title('Acquiring data...')
pause(1)
% Get data from reference arm
[rawBscan, ~, ~] = acq_Bscan(@rectwin,false);
subplot(121)
title('B-scan from sample arm');
% Average A-lines of reference arm
refArm = mean(rawBscan,2);

subplot(121)
title('Please block reference arm and press any key when ready...')
pause()
% Send command chain ('A\n\r nLinesPerFrame nFrames') to the socket server
pnet(SSOctDefaults.tcpConn,'write',uint8([65 10 13 ...
    typecast(uint16(SSOctDefaults.nLinesPerFrame), 'uint8') ...
    typecast(uint16(SSOctDefaults.nFrames), 'uint8')]));
title('Acquiring data...')
pause(0.1)
% Get data from sample arm
[rawBscan, ~, ~] = acq_Bscan(@rectwin,false);
subplot(121)
title('B-scan from sample arm');
% Average A-lines of sample arm
sampleArm = mean(rawBscan,2);

% Update global variable
SSOctDefaults.sampleArm = sampleArm;
SSOctDefaults.refArm    = refArm;

% Save reference and sample arm measurements
save(fullfile(SSOctDefaults.dirCurrExp,'Reference_Measurements'),'sampleArm','refArm');

subplot(121)
title('Please unblock both arms and press any key when ready...')
pause()
title('Acquiring data...')

% ==============================================================================
% [EOF]
