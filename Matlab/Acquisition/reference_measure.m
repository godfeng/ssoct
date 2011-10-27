function [sampleArm, refArm] = reference_measure(hContAcq)
% Takes a reference measurement. User is asked to block the sample arm before
% data is recorded.
% Reference data is saved to Reference_Measurements.mat in the experiment folder
% SYNTAX:
% [sampleArm, refArm] = reference_measure(hContAcq)
% INPUTS:
% hContAcq      Handle to figure where the measurement is to be displayed
% OUTPUTS:
% sampleArm     empty vector (for the time being)
% refArm        Averaged A-line of reference (whole B-scan is also saved)
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Correct B-scan flag
SSOctDefaults.corrBscan         = false;

% Signal from sample arm
sampleArm   = zeros([SSOctDefaults.NSAMPLES 1]);
fprintf('Taking reference measurement...Press <Ctrl>+<C> to cancel\n')

figure(hContAcq)
subplot(121)
title('Please block sample arm and press any key when ready...')
pause()
% Send command chain ('B') to the socket server.
pnet(SSOctDefaults.tcpConn,'write',uint8(66));
pause(0.1)

title('Acquiring data...')
% Get data from reference arm
dbstop if error
pause(SSOctDefaults.pauseTime);         % Necessary pause before data transfer
[rawBscanRef, ~] = acq_Bscan(@rectwin,false);
% Average A-lines of reference arm
refArm = mean(rawBscanRef,2);

% Update global variable
SSOctDefaults.refArm    = refArm;
SSOctDefaults.sampleArm = sampleArm;

% Save reference and sample arm measurements
save(fullfile(SSOctDefaults.dirCurrExp,'Reference_Measurements'),'sampleArm',...
    'refArm','rawBscanRef');

[posEnv negEnv] = detect_envelope(refArm);

if SSOctDefaults.corrBscan
    limitY = [-2^13 2^13];
else
     limitY = [0 2^14];
end
subplot(222);
if SSOctDefaults.displaySingleLine
    % -------------- Plot a single interferogram (A-line) ------------------
    plot(1e9*SSOctDefaults.vectorLambda, refArm, 'k-',...
        1e9*SSOctDefaults.vectorLambda, posEnv,'r:',...
        1e9*SSOctDefaults.vectorLambda, negEnv,'b:');
    title('Reference measurement')
    xlabel('\lambda [nm]')
    ylabel('Intensity [ADC units]')
    xlim(1e9*[SSOctDefaults.minLambda SSOctDefaults.maxLambda])
    ylim(limitY)
else
    % -------------- Plot interferogram (B-scan) ------------------
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e9*SSOctDefaults.vectorLambda, ...
        rawBscanRef, [0 16384]);
    title('Reference measurement')
    xlabel('A-lines')
    ylabel('\lambda [nm]')
    if SSOctDefaults.displayColorBar
        colorbar;
    else
        colorbar off;
    end
end

% ------------------- Display a reference B-scan -------------------------------
subplot(121)
Bscan = BmodeScan2struct(rawBscanRef);
if SSOctDefaults.displayLog
    % Display in log scale, single-sided FFT, with z-axis in um
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
        log(Bscan(SSOctDefaults.NSAMPLES/2+1:end,:)+1));
else
    % Display in linear scale, single-sided FFT, with z-axis in um
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
        Bscan(SSOctDefaults.NSAMPLES/2+1:end,:))
end
if SSOctDefaults.displayColorBar
    colorbar;
else
    colorbar off;
end
axis tight
colormap(flipud(gray(255)))
ylabel('z [mm]')
xlabel('A-lines')

title('Please unblock both arms and press any key when ready...')

pause()
% Correct B-scan flag
SSOctDefaults.corrBscan         = true;
return
% ==============================================================================
% [EOF]
