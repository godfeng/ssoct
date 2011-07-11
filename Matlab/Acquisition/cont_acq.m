function cont_acq
%_______________________________________________________________________________
% Copyright (C) 2010 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Continuous acquisition 'C\n\r'
rawDataCont = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame],'int16');

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
        for iLines = 1:SSOctDefaults.nLinesPerFrame,
            % Reads an array of NSAMPLES elements from a connection
            rawDataCont(:,iLines) = pnet(SSOctDefaults.tcpConn,'read',[SSOctDefaults.NSAMPLES 1],'int16');
            if (iLines == 10)
                subplot(222);
                plot(rawDataCont(:,iLines));
            end
        end
        
        % Save a B-scan frame
        fwrite(fid, rawDataCont, 'int16');
        
        % Display a B-scan (single frame)
        subplot(121)
        imagesc(BmodeScan2struct(rawDataCont));
        axis image;
        colormap(gray(255));
        title(sprintf('Continuous Transfer. Frame %d',iFrames));
    end
    fclose(fid);
else
    iFrames = 1;
    while(1),
        for iLines = 1:SSOctDefaults.nLinesPerFrame,
            % Reads an array of NSAMPLES elements from a connection
            rawDataCont(:,iLines) = pnet(SSOctDefaults.tcpConn,'read',[SSOctDefaults.NSAMPLES 1],'int16');
            % Correct first sample (always zero, should know why)
            rawDataCont(1,iLines) = rawDataCont(2,iLines);
            % CORRECTION ALGORITHM HERE!!!!
            correctedAline = correct_A_line(rawAline, sampleArm, refArm);
            if (iLines == 10)
                subplot(222);
                plot(rawDataCont(:,iLines));
                ylim([0 2^14])
                title('Interferogram')
                subplot(224);
                plot(abs(ifftshift(fft(double(rawDataCont(:,iLines) - 2^13)))));
                title('FFT of the interferogram')
            end
        end
        % Display a B-scan (single frame)
        subplot(121)
        % log scale
        imagesc(log10(BmodeScan2struct(rawDataCont)));
        axis image;
        colormap(gray(255));
        title(sprintf('Continuous Transfer. Frame %d',iFrames));
        iFrames = iFrames + 1;
    end
end
