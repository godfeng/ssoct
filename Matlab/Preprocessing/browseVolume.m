function hFig = browseVolume(varargin)
% Displays structural data from a volume (.dat file)
% SYNTAX:
% hFig = browseVolume(varargin)
% INPUTS:
% [fileName]    Optional input with the full file name (path+file.dat)
% OUTPUTS:
% hFig          Handle to current figure
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/11/01


% Modifies values of global variable
global SSOctDefaults
% Load default parameters
ss_oct_get_defaults

% Parse input arguments to readOCTmapFile
optArgs = varargin;

% Map acquisition file to memory
[mappedFile, pathName] = readOCTmapFile(optArgs);

% Load reference values
load(fullfile(pathName,'Reference_Measurements.mat'));
% Resample reference B-scan
resampledRawBscanRef = resample_B_scan(rawBscanRef);
% Update reference A-line
SSOctDefaults.refArm = mean(resampledRawBscanRef,2);
% Get structure
resampledStruct2D = BmodeScan2struct(resampledRawBscanRef);

% Reference scan
hRef = figure; set(gcf,'color','w')
% Change figure name
set(hRef,'Name', 'Reference Scan');
% ---------------------------- Display reference scan --------------------------
if SSOctDefaults.displayLog
    % Display in log scale, single-sided FFT (left part of spectrum), with
    % z-axis in um
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
        log(resampledStruct2D(SSOctDefaults.NSAMPLES/2:-1:1,:)+1));
    title('log(R). Reference')
else
    % Display in linear scale, single-sided FFT (left part of spectrum), with
    % z-axis in um
    imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
        resampledStruct2D(SSOctDefaults.NSAMPLES/2:-1:1,:));
    title('Reference')
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
% Clean up
clear refArm sampleArm rawBscanRef resampledRawBscanRef

% ---------------------------- Display volume ----------------------------------
% Create new figure
hFig = figure;
set(hFig,'color','w')
% Change figure name
set(hFig,'Name',[SSOctDefaults.acqParam{8,1} ': '...
    SSOctDefaults.acqParam{8,2} '. ' SSOctDefaults.acqParam{9,1} ': '...
    SSOctDefaults.acqParam{9,2} '.'])
% Number of transferred frames
nFrames = mappedFile.format{2}(3);
% Display frames loop
for iFrames = 1:nFrames,
    % Convert a single B-scan to double
    rawBscan = double(squeeze(mappedFile.Data.rawData(:,:,iFrames)));
    % Resample/interpolate B-scan
    resampledRawBscan = resample_B_scan(rawBscan);
    % Apply windowing function and subtract the reference
    resampledCorrectedBscan = correct_B_scan(resampledRawBscan,@hann,'true');
    % Obtain structural data
    resampledStruct2D = BmodeScan2struct(resampledCorrectedBscan);
    if iFrames == 1,
        % Color scale
        minColor = min(resampledStruct2D(:));
        maxColor = max(resampledStruct2D(:));
    end
    figure(hFig)
    if SSOctDefaults.displayLog
        % Display in log scale, single-sided FFT (left part of spectrum), with
        % z-axis in um
        imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
            log(resampledStruct2D(SSOctDefaults.NSAMPLES/2:-1:1,:)+1),...
            [minColor maxColor]);
        title(sprintf('log(R). Frame %d of %d', iFrames, nFrames))
    else
        % Display in linear scale, single-sided FFT (left part of spectrum), with
        % z-axis in um
        imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
            resampledStruct2D(SSOctDefaults.NSAMPLES/2:-1:1,:),...
            [minColor maxColor]);
        title(sprintf('Frame %d of %d', iFrames, nFrames))
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
    pause(0.5)
end
% ==============================================================================
% [EOF]
