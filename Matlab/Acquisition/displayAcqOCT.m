function [rawBscan rawBscan16] = displayAcqOCT(iFrames,hContAcq)
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
% Acquire raw B-scan
[rawBscan rawBscan16] = acq_Bscan(@rectwin,false);
% Save data in a big variable
% SSOctDefaults.OCTfullAcq(iFrames,:,:) = rawBscan;
% Negative and Positive envelope
[posEnv negEnv] = detect_envelope(rawBscan(:,2));

% Go to specific figure
figure(hContAcq)

subplot(222);
if SSOctDefaults.displaySingleLine
    % -------------- Plot a single interferogram (A-line) ------------------
    plot(1e9*SSOctDefaults.vectorLambda, rawBscan(:,2), 'k-',...
        1e9*SSOctDefaults.vectorLambda, posEnv,'r:',...
        1e9*SSOctDefaults.vectorLambda, negEnv,'b:');
    title('Interferogram')
    xlabel('\lambda [nm]')
    ylabel('Intensity [ADC units]')
    xlim(1e9*[SSOctDefaults.minLambda SSOctDefaults.maxLambda])
    ylim([0 16384])
else
    % -------------- Plot interferogram (B-scan) ------------------
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e9*SSOctDefaults.vectorLambda, ...
        rawBscan, [0 16384]);
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
    (rawBscan(:,2)))),'-k')
title('Interferogram phase')
xlabel('\lambda [nm]')
xlim(1e9*[SSOctDefaults.minLambda SSOctDefaults.maxLambda])

% --------------- Plot the a single A-line (FFT) -----------------------
subplot(247)
singleAline = BmodeScan2struct(rawBscan(:,2));    % log FFT
% Take only positive half of the symmetric FFT
singleAline = singleAline(SSOctDefaults.NSAMPLES/2 + 1 : ...
    SSOctDefaults.NSAMPLES);
if SSOctDefaults.displayLog
    singleAline = log(singleAline + 1);
    plot(10^3*SSOctDefaults.positiveZaxis_air, singleAline,'k-')
    ylabel('log(R) [a.u.]')
else
    plot(10^3*SSOctDefaults.positiveZaxis_air, singleAline,'k-')
    ylabel('Reflectivity [a.u.]')
end
title('Single A-line')
xlabel('z [mm]')

% --------------- Display a B-scan (single frame) ----------------------
subplot(121)
Bscan = BmodeScan2struct(rawBscan);
if SSOctDefaults.displayLog
    % Display in log scale, single-sided FFT, with z-axis in um
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
        log(Bscan(SSOctDefaults.NSAMPLES/2+1:end,:)+1));
    title(sprintf('log(R). Continuous Transfer. Frame %d',iFrames))
else
    % Display in linear scale, single-sided FFT, with z-axis in um
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
        Bscan(SSOctDefaults.NSAMPLES/2+1:end,:))
    title(sprintf('Continuous Transfer. Frame %d',iFrames))
end
if SSOctDefaults.displayColorBar
    colorbar;
else
    colorbar off;
end
axis tight
colormap(gray(255))
ylabel('z [mm]')
xlabel('A-lines')
% ==============================================================================
% [EOF]
