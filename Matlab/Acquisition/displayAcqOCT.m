function [rawBscan rawBscan16 correctedBscan] = displayAcqOCT(iFrames,hContAcq)
% ------------- Acquires and displays a single B-scan (frame) ------------------
% SYNTAX:
% [rawBscan rawBscan16] = displayAcqOCT(iFrames)
% INPUTS:
% iFrames       Current B-scan
% hContAcq      Handle to the current figure
% OUTPUTS:
% rawBscan      Uncorrected B-scan
% rawBscan16    Uncorrected B-scan (uint16 format), this data are saved to file
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/10/07

% Modifies values of global variable
global SSOctDefaults
if rem(iFrames-1, SSOctDefaults.nFrames) == 0,
    pause(SSOctDefaults.pauseTime);         % Necessary pause before data transfer
end
% Acquire raw B-scan
if SSOctDefaults.corrBscan
    [rawBscan rawBscan16 correctedBscan] = acq_Bscan(@hann,true);
    limitY = [-2^13 2^13];
else
    [rawBscan rawBscan16] = acq_Bscan(@rectwin,false);
    correctedBscan = double(rawBscan);
     limitY = [0 2^14];
end
% Save data in a big variable
% SSOctDefaults.OCTfullAcq(iFrames,:,:) = rawBscan;
% Negative and Positive envelope
[posEnv negEnv] = detect_envelope(correctedBscan(:,2));

% Go to specific figure
figure(hContAcq)

subplot(222);
if SSOctDefaults.displaySingleLine
    % -------------- Plot a single interferogram (A-line) ------------------
    plot(1e9*SSOctDefaults.vectorLambda, correctedBscan(:,2), 'k-',...
        1e9*SSOctDefaults.vectorLambda, posEnv,'r:',...
        1e9*SSOctDefaults.vectorLambda, negEnv,'b:');
    title('Interferogram')
    xlabel('\lambda [nm]')
    ylabel('Intensity [ADC units]')
    xlim(1e9*[SSOctDefaults.minLambda SSOctDefaults.maxLambda])
    ylim(limitY)
else
    % -------------- Plot interferogram (B-scan) ------------------
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e9*SSOctDefaults.vectorLambda, ...
        correctedBscan, limitY);
    title('Interferogram')
    xlabel('A-lines')
    ylabel('\lambda [nm]')
    if SSOctDefaults.displayColorBar
        colorbar;
    else
        colorbar off;
    end
end

% ------------ Plot the phase of a single A-line -----------------------
subplot(248)
plot(1e9*SSOctDefaults.vectorLambda, unwrap(angle(hilbert...
    (correctedBscan(:,2)))),'-k')
title('Interferogram phase')
xlabel('\lambda [nm]')
xlim(1e9*[SSOctDefaults.minLambda SSOctDefaults.maxLambda])

% --------------- Plot the a single A-line (FFT) -----------------------
subplot(247)
singleAline = BmodeScan2struct(correctedBscan(:,2));    % log FFT
% Take only left part of spectrum
singleAline = singleAline(SSOctDefaults.NSAMPLES/2:-1:1);
if SSOctDefaults.displayLog
    singleAline = log(singleAline + 1);
    plot(10^3*SSOctDefaults.positiveZaxis_air, singleAline,'k-')
    ylabel('log(R) [a.u.]')
    title('Single A-line')
else
    ylabel('Reflectivity [a.u.]')
    if SSOctDefaults.showFWHM
        % Show FWHM in real time (only when linear display is enabled)
        [~, peak_pos, FWHMum, peak_pos_m] = fwhm(singleAline);
        plot(1e3*peak_pos_m,singleAline(peak_pos),'ro')
        title([sprintf('FWHM = %.2f',FWHMum) ' \mum'])
        hold on
    else
        title('Single A-line')
    end
    plot(10^3*SSOctDefaults.positiveZaxis_air, singleAline,'k-')
    ylabel('(R) [a.u.]')
end
hold off
xlabel('z [mm]')

% --------------- Display a B-scan (single frame) ----------------------
subplot(121)
Bscan = BmodeScan2struct(correctedBscan);
if SSOctDefaults.displayLog
    % Display in log scale, single-sided FFT (left part of spectrum), with
    % z-axis in um
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
        log(Bscan(SSOctDefaults.NSAMPLES/2:-1:1,:)+1));
    title(sprintf('log(R). Continuous Transfer. Frame %d',iFrames))
else
    % Display in linear scale, single-sided FFT (left part of spectrum), with
    % z-axis in um
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
        Bscan(SSOctDefaults.NSAMPLES/2:-1:1,:));
    title(sprintf('Continuous Transfer. Frame %d',iFrames))
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
% ==============================================================================
% [EOF]
