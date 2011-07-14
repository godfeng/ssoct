function cont_acq
%_______________________________________________________________________________
% Copyright (C) 2010 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Preallocation
rawBscan = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame],'int16');

if SSOctDefaults.save2file
    fprintf('Continuous acquisition of %d A-lines...\n',SSOctDefaults.nAcqSamples)
else
    fprintf('Continuous acquisition...Press <Ctrl>+<C> to cancel\n')
end

% New figure on white background
figure; set(gcf,'color','w')
% Change figure name
set(gcf,'Name','Continuous Acquisition')
% Maximize figure
set(gcf, 'OuterPosition', SSOctDefaults.screenSize);


if SSOctDefaults.save2file
    % Default file name
    filename = fullfile(SSOctDefaults.dirExp,[datestr(now,'yyyy.mm.dd_HH.MM.SS') '.dat']);
    % Create binary file
    fid = fopen(filename, 'w');
end
% Send command 67 ('C\n\r') to the socket server
pnet(SSOctDefaults.tcpConn,'write',uint8([67 10 13]));

if SSOctDefaults.save2file
    for iFrames = 1:SSOctDefaults.nFrames,
        rawBscan = acq_Bscan;
        % ---------------------- Plot a single A-line --------------------------
        subplot(222);
        plot(SSOctDefaults.vectorLambda, rawBscan(:,2));
        title('Interferogram')
        xlabel('\lambda [nm]')
        xlim([SSOctDefaults.minLambda SSOctDefaults.maxLambda])
        % ------------ Plot the phase of a single A-line -----------------------
        subplot(248);
        plot(SSOctDefaults.vectorLambda, unwrap(angle(hilbert(rawBscan(:,2)))));
        title('Interferogram phase')
        xlabel('\lambda [nm]')
        xlim([SSOctDefaults.minLambda SSOctDefaults.maxLambda])
        % --------------- Plot the FFT of a single A-line ----------------------
        subplot(247);
        plot([-fliplr(SSOctDefaults.vectorLambda) SSOctDefaults.vectorLambda],abs(ifftshift(fft(double(rawBscan(:,2))))));    % FFT
        title('single A-line')
        xlabel('\lambda [nm]')
        % --------------- Display a B-scan (single frame) ----------------------
        subplot(121)
        Bscan = BmodeScan2struct(rawBscan);
        % Display in linear scale, single-sided FFT, with z-axis in um
        imagesc(1:SSOctDefaults.nLinesPerFrame, SSOctDefaults.zAxis,...
            Bscan(SSOctDefaults.NSAMPLES/2+1:end,:));
        axis tight;
        colormap(gray(255));
        title(sprintf('Continuous Transfer. Frame %d',iFrames));
        ylabel('z [\mum]')
        xlabel('A-lines')
        % --------------------- Save a B-scan frame ----------------------------
        fwrite(fid, rawBscan, 'double');
    end
    fclose(fid);
    disp(['File saved as: ' filename])
else
    iFrames = 1;
    while(1),
        rawBscan = acq_Bscan;
        % -------------- Plot a single interferogram (A-line) ------------------
        subplot(222);
        hold on
        plot(1e9*SSOctDefaults.vectorLambda, rawBscan(:,2), 'k-');
        title('Interferogram')
        xlabel('\lambda [nm]')
        xlim(1e9*[SSOctDefaults.minLambda SSOctDefaults.maxLambda])
        % Amplitude correction
        [posEnv negEnv] = detect_envelope(rawBscan(:,2));
        plot(1e9*SSOctDefaults.vectorLambda, posEnv,'r:')
        plot(1e9*SSOctDefaults.vectorLambda, negEnv,'b:')
        hold off
        % ------------ Plot the phase of a single A-line -----------------------
        subplot(248)
        plot(SSOctDefaults.vectorLambda, unwrap(angle(hilbert(rawBscan(:,2)))),'-k')
        title('Interferogram phase')
        xlabel('\lambda [nm]')
        xlim([SSOctDefaults.minLambda SSOctDefaults.maxLambda])
        % --------------- Plot the a single A-line (FFT) -----------------------
        subplot(247)
        plot(abs(ifftshift(fft(rawBscan(:,2)))),'-k')    % FFT
        xlim([1 SSOctDefaults.NSAMPLES])
        title('Single A-line')
        xlabel('Samples')
        % --------------- Display a B-scan (single frame) ----------------------
        subplot(121)
        Bscan = BmodeScan2struct(rawBscan);
        % Display in linear scale, single-sided FFT, with z-axis in um
        imagesc(1:SSOctDefaults.nLinesPerFrame, SSOctDefaults.zAxis,...
            Bscan(SSOctDefaults.NSAMPLES/2+1:end,:))
        axis tight
        colormap(gray(255))
        title(sprintf('Continuous Transfer. Frame %d',iFrames))
        ylabel('z [\mum]')
        xlabel('A-lines')
        iFrames = iFrames + 1;
    end
end
