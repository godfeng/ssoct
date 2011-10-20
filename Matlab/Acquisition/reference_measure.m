function [sampleArm, refArm] = reference_measure(hContAcq)
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Raw data matrix
% rawData     = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame],'uint16');
% Signal from reference arm
% refArm      = zeros([SSOctDefaults.NSAMPLES 1]);
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
% Send command chain ('A') to the socket server. 2 times????
pnet(SSOctDefaults.tcpConn,'write',uint8(65));
pause(0.1)
% pnet(SSOctDefaults.tcpConn,'write',uint8(65));

title('Acquiring data...')
% Get data from reference arm
[rawBscan, ~] = acq_Bscan(@rectwin,false);
subplot(121)
title('B-scan from sample arm');
% Average A-lines of reference arm
refArm = mean(rawBscan,2);

% Update global variable
SSOctDefaults.refArm    = refArm;
SSOctDefaults.sampleArm = sampleArm;

% Save reference and sample arm measurements
save(fullfile(SSOctDefaults.dirCurrExp,'Reference_Measurements'),'sampleArm','refArm');

subplot(121)
title('Please unblock both arms and press any key when ready...')
pause()
return
% ==============================================================================
% [EOF]
