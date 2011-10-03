function polarization_control_mode
% Continuous acquisition, no corrections, FWHM measurement of the FFT, useful
% mode when adjusting polarization control
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/20
% Modifies values of global variable
global SSOctDefaults

% Preallocation
rawBscan = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame],'uint16');

fprintf('Continuous acquisition...Press <Ctrl>+<C> to cancel\n')

% New figure on white background
figure; set(gcf,'color','w')
% Change figure name
set(gcf,'Name','Polarization control mode')
% Maximize figure
set(gcf, 'OuterPosition', SSOctDefaults.screenSize);

% Send command 67 ('C\n\r') to the socket server
pnet(SSOctDefaults.tcpConn,'write',uint8([67 10 13]));


iFrames = 1;
while(1),
    rawBscan = acq_Bscan(@rectwin,true);
    % Negative and Positive envelope
    [posEnv negEnv] = detect_envelope(rawBscan(:,2));
    % -------------- Plot a single interferogram (A-line) ------------------
    subplot(222);
    plot(1e9*SSOctDefaults.vectorLambda, rawBscan(:,2), 'k-',...
        1e9*SSOctDefaults.vectorLambda, posEnv,'r:',...
        1e9*SSOctDefaults.vectorLambda, negEnv,'b:');
    title('Interferogram')
    xlabel('\lambda [nm]')
    xlim(1e9*[SSOctDefaults.minLambda SSOctDefaults.maxLambda])
%     ylim([0 2^14]);
    % ------------ Plot the phase of a single A-line -----------------------
    subplot(248)
    plot(1e9*SSOctDefaults.vectorLambda, unwrap(angle(hilbert...
        (rawBscan(:,2)))),'-k')
    title('Interferogram phase')
    xlabel('\lambda [nm]')
    xlim(1e9*[SSOctDefaults.minLambda SSOctDefaults.maxLambda])
    % --------------- Plot the a single A-line (FFT) -----------------------
    subplot(247)
    Aline = BmodeScan2struct(rawBscan(:,2));
    Aline = Aline(SSOctDefaults.NSAMPLES/2 + 2 : end);
    Aline = Aline ./ max(Aline);
    plot(SSOctDefaults.NSAMPLES/2 + 2 : SSOctDefaults.NSAMPLES,Aline,'-k') % FFT
    % Find peaks and FWHM
    [FWHM,peak_pos] = calculate_FWHM(Aline);
    xlim([SSOctDefaults.NSAMPLES/2 + 2 SSOctDefaults.NSAMPLES])
    title(sprintf('Single A-line, FWHM = %0.2f @ sample: %d', FWHM, ...
        peak_pos+SSOctDefaults.NSAMPLES/2 + 2))
    xlabel('Samples')
    % --------------- Display a B-scan (single frame) ----------------------
    subplot(121)
    Bscan = BmodeScan2struct(rawBscan);
    % Display in linear scale, single-sided FFT, with z-axis in um
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis,...
        Bscan(SSOctDefaults.NSAMPLES/2+1:end,:))
    axis tight
    colormap(gray(255))
    title(sprintf('Continuous Transfer. Frame %d',iFrames))
    ylabel('z [mm]')
    xlabel('A-lines')
    iFrames = iFrames + 1;
end

% ==============================================================================
% [EOF]
