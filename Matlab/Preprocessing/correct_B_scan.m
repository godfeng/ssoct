function correctedBscan = correct_B_scan(rawBscan, varargin)
% SYNTAX:
% correctedBscan = correct_B_scan(rawBscan, windowType, correctBackground)
% INPUTS:
% rawBscan          raw B-scan from OCT (set of interferograms)
% [windowType]      Function handle to the window function to use:
%                   @barthannwin    @bartlett   @blackman   @blackmanharris
%                   @bohmanwin      @flattopwin @gausswin   @hamming
%                   @hann           @nuttallwin @parzenwin  @rectwin
%                   @taylorwin      @triang
% [correctBackground] if true, applies correction method to raw B-scan
% OUTPUTS:
% correctedBscan    set of A/lines, already windowed and corrected for
%                   background signal
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Values taken previously (see reference_measure.m)
% Background signal from the reference arm (sample arm blocked)
if isfield(SSOctDefaults,'refArm')
    refArm      = SSOctDefaults.refArm;
end
% Self interference signal from the sample arm (reference arm blocked)
% if isfield(SSOctDefaults,'sampleArm')
%     sampleArm   = SSOctDefaults.sampleArm;
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
[winFunction correctBackground] = optArgs{:};

if correctBackground
    % Background signal from the reference arm (sample arm blocked)
    refMatrix       = repmat(refArm, [1 SSOctDefaults.nLinesPerFrame]);
    % Self interference signal from the sample arm (reference arm blocked)
    % sampleMatrix    = repmat(sampleArm, [1 SSOctDefaults.nLinesPerFrame]);

    % Digital subtraction of background signal (reference signal when the sample
    % arm is blocked). Spectral shaping is done by dividing the interferogram by
    % the self-interference term.
    correctedBscan = (double(rawBscan) - refMatrix);
else
    correctedBscan = double(rawBscan);
end
% Apply window to the interferogram
% correctedBscan = correctedBscan.*repmat(winFunction(SSOctDefaults.NSAMPLES), ...
%     [1 SSOctDefaults.nLinesPerFrame]);

% replacement of repmat is 2% faster this way!
tmpCorrArray = winFunction(SSOctDefaults.NSAMPLES);
correctedBscan = correctedBscan.*tmpCorrArray(:,ones(SSOctDefaults.nLinesPerFrame, 1));

% ==============================================================================
% [EOF]
