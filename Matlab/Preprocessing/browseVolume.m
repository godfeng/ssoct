function [rawBscan refBscan Bscan hFig] = browseVolume(varargin)
% Displays structural data from a volume (.dat file)
% SYNTAX:
% [rawBscan refBscan Bscan hFig] = browseVolume([frames], [filename])
% INPUTS:
% [frames]      Index of B-scans to show
% [fileName]    Optional input with the full file name (path+file.dat)
% OUTPUTS:
% rawBscan      Raw B-scan
% refBscan      Raw reference B-scan
% Bscan         Processed B-scan structure
% hFig          Handle to current figure
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/11/01

% Show Reference Image
showRefScan = false;
% Pause time
pauseTime = 0.05;

% Modifies values of global variable
global SSOctDefaults
% Load default parameters
ss_oct_get_defaults
% only want 1 optional inputs at most
numVarArgs = length(varargin);
if numVarArgs > 2
    error('browseVolume:TooManyInputs', ...
        'requires at most 2 optional input');
end

% set defaults for optional inputs (empty)
optArgs = {[] []};

% now put these defaults into the optArgs cell array,
% and overwrite the ones specified in varargin.
optArgs(1:numVarArgs) = varargin;
% or ...
% [optargs{1:numvarargs}] = varargin{:};

% Place optional args in memorable variable names
[framesRange fileName] = optArgs{:};

% Map acquisition file to memory
[mappedFile, pathName] = readOCTmapFile(fileName);

% ---------------------------- Display reference scan --------------------------
% Load reference values
load(fullfile(pathName,'Reference_Measurements.mat'));
if SSOctDefaults.resampleData
    % Resample reference B-scan
    resampledRawBscanRef = resample_B_scan(rawBscanRef);
    % Update reference A-line
    SSOctDefaults.refArm = mean(resampledRawBscanRef,2);
else
    % Do not resample
    resampledRawBscanRef = rawBscanRef;
    % Update reference A-line
    SSOctDefaults.refArm = mean(resampledRawBscanRef,2);
end
% Get structure   
resampledStruct2D = BmodeScan2struct(resampledRawBscanRef);

if showRefScan
    % Reference scan figure
    hRef = figure; set(gcf,'color','w')
    % Change figure name
    set(hRef,'Name', 'Reference Scan');
    if SSOctDefaults.displayLog
        % Display in log scale, single-sided FFT (left part of spectrum), with
        % z-axis in um
        resampledStruct2D = resampledStruct2D(SSOctDefaults.NSAMPLES/2:-1:1,:);

        % noise_lower_fraction = 0.1
        noise_lower_fraction = 0.1;
        noise_floor = mean(...
            mean(resampledStruct2D(round((1-noise_lower_fraction)*end):end,:)));
        resampledStruct2D = 10*log10(resampledStruct2D / noise_floor);
        resampledStruct2D(resampledStruct2D < 0) = 0;
        
        if iFrames == framesRange(1),
            % Scale color to the first frame
            minColor = min(resampledStruct2D(:));
            maxColor = max(resampledStruct2D(:));
        end        
        
        imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
            resampledStruct2D,...
            [minColor maxColor]);
        title(sprintf('log(R). Frame %d of %d', iFrames, nFrames))
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
    colormap(SSOctDefaults.OCTcolorMap)
    ylabel('z [mm]')
    xlabel('A-lines')
end
% Output
refBscan = rawBscanRef;
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
tilefigs
% Number of transferred frames
nFrames = mappedFile.format{2}(3);

% Browse entire file
if isempty(framesRange)
    framesRange = 1:nFrames;
else
    % Keep only valid indices
    framesRange = framesRange(framesRange<=nFrames);
end

% Display frames loop
for iFrames = framesRange,
    % Convert a single B-scan to double
    rawBscan = double(squeeze(mappedFile.Data.rawData(:,:,iFrames)));
    if SSOctDefaults.resampleData
        % Resample/interpolate B-scan
        resampledRawBscan = resample_B_scan(rawBscan);
    else
        % Do not resample
        resampledRawBscan = rawBscan;
    end
    % Apply windowing function and subtract the reference
    resampledCorrectedBscan = correct_B_scan(resampledRawBscan,@hann,'true');
    % Obtain structural data
    resampledStruct2D = BmodeScan2struct(resampledCorrectedBscan);
    % Output
    Bscan = resampledStruct2D;
    
    figure(hFig)
    if SSOctDefaults.displayLog
        % Display in log scale, single-sided FFT (left part of spectrum), with
        % z-axis in um
        resampledStruct2D = resampledStruct2D(SSOctDefaults.NSAMPLES/2:-1:1,:);

        % noise_lower_fraction = 0.1
        noise_lower_fraction = 0.1;
        noise_floor = mean(...
            mean(resampledStruct2D(round((1-noise_lower_fraction)*end):end,:)));
        resampledStruct2D = 10*log10(resampledStruct2D / noise_floor);
        resampledStruct2D(resampledStruct2D < 0) = 0;
        
        if iFrames == framesRange(1),
            % Scale color to the first frame
            minColor = min(resampledStruct2D(:));
            maxColor = max(resampledStruct2D(:));
        end
        
        imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis_air,...
            resampledStruct2D,...
            [minColor maxColor]);
        title(sprintf('log(R). Frame %d of %d', iFrames, nFrames))
    else
            if iFrames == framesRange(1),
                % Scale color to the first frame
                minColor = min(resampledStruct2D(:));
                maxColor = max(resampledStruct2D(:));
            end
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
    colormap(SSOctDefaults.OCTcolorMap)
    ylabel('z [mm]')
    xlabel('A-lines')
    pause(pauseTime)
end
% ==============================================================================
% [EOF]
