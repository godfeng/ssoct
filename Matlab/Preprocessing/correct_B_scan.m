function correctedBscan = correct_B_scan(rawBscan, varargin)
% Subtracts reference signal from raw B-scan, applies window function and
% resamples B-scan, depending on flags set in global variable ssOCTdefaults
% SYNTAX:
% correctedBscan = correct_B_scan(rawBscan, windowType, subtractBackground)
% INPUTS:
% rawBscan          raw B-scan from OCT (set of interferograms)
% [windowType]      Function handle to the window function to use:
%                   @barthannwin    @bartlett   @blackman   @blackmanharris
%                   @bohmanwin      @flattopwin @gausswin   @hamming
%                   @hann           @nuttallwin @parzenwin  @rectwin
%                   @taylorwin      @triang
% [subtractBackground] if true, subtracts reference signal from raw B-scan
% OUTPUTS:
% correctedBscan    set of A/lines, already windowed and corrected for
%                   background signal
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global ssOCTdefaults

% Values taken previously (see reference_measure.m)
% Background signal from the reference arm (sample arm blocked)
if isfield(ssOCTdefaults,'refArm')
    refArm      = ssOCTdefaults.refArm;
else
    % Read binary .DAT file
    refArm = readOCTmapFile(fullfile(ssOCTdefaults.folders.dirCurrExp,'referenceFrame.dat'));
    refArm = mean(double(squeeze(refArm.Data.rawData(:,:,1))),2);
    % Update global variable
    ssOCTdefaults.refArm = refArm;
end

% Calculate the reference signal as the median A-line of current B-scan
if ssOCTdefaults.medianRefArm,
%     ssOCTdefaults.refArm    = median(rawBscan,2);
%     refArm                  = ssOCTdefaults.refArm;
end

% Self interference signal from the sample arm (reference arm blocked)
% if isfield(ssOCTdefaults,'sampleArm')
%     sampleArm   = ssOCTdefaults.sampleArm;
% end

% only want 2 optional inputs at most
numVarArgs = length(varargin);
if numVarArgs > 2
    error('correct_B_scan:TooManyInputs', ...
        'requires at most 1 optional input');
end

% set defaults for optional inputs (@hann window, correction enabled)
optArgs = {@hann true};

% now put these defaults into the optArgs cell array, 
% and overwrite the ones specified in varargin.
optArgs(1:numVarArgs) = varargin;
% or ...
% [optargs{1:numvarargs}] = varargin{:};

% Place optional args in memorable variable names
[winFunction subtractBackground] = optArgs{:};

if subtractBackground
    % Background signal from the reference arm (sample arm blocked)
    % refMatrix       = repmat(refArm, [1 ssOCTdefaults.nLinesPerFrame]);
    % replacement of repmat is 2% faster this way!
    refMatrix = refArm(:,ones(ssOCTdefaults.nLinesPerFrame, 1));
    
    % Self interference signal from the sample arm (reference arm blocked)
    % sampleMatrix    = repmat(sampleArm, [1 ssOCTdefaults.nLinesPerFrame]);

    % Digital subtraction of background signal (reference signal when the sample
    % arm is blocked). 
    correctedBscan = (double(rawBscan) - refMatrix);
else
    correctedBscan = double(rawBscan);
end

% Resampling in k-space
if ssOCTdefaults.resampleData
    % K-clock resampling of a B-scan
    correctedBscan = resample_B_scan(correctedBscan);
end

% Apply window to the interferogram
% correctedBscan = correctedBscan.*repmat(winFunction(ssOCTdefaults.NSAMPLES), ...
%     [1 ssOCTdefaults.nLinesPerFrame]);
% replacement of repmat is 2% faster this way!
tmpCorrArray = winFunction(ssOCTdefaults.NSAMPLES);
correctedBscan = correctedBscan.*tmpCorrArray(:,ones(ssOCTdefaults.nLinesPerFrame, 1));

% ==============================================================================
% [EOF]
