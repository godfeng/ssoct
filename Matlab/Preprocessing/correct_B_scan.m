function correctedBscan = correct_B_scan(rawBscan, varargin)
% SYNTAX:
% correctedBscan = correct_B_scan(rawBscan, windowType)
% INPUTS:
% rawBscan      raw B-scan from OCT (group of interferograms)
% windowType    Function handle to the window function to use:
%               @barthannwin    @bartlett   @blackman   @blackmanharris
%               @bohmanwin      @flattopwin @gausswin   @hamming
%               @hann           @nuttallwin @parzenwin  @rectwin
%               @taylorwin      @triang
% OUTPUTS:
%_______________________________________________________________________________
% Copyright (C) 2010 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Values taken previously
% Self interference signal from the sample arm (reference arm blocked)
sampleArm   = SSOctDefaults.sampleArm;
% Background signal from the reference arm (sample arm blocked)
refArm      = SSOctDefaults.refArm;

% only want 1 optional inputs at most
numVarArgs = length(varargin);
if numVarArgs > 1
    error('correct_B_scan:TooManyInputs', ...
        'requires at most 1 optional input');
end

% set defaults for optional inputs (@hann window)
optArgs = {@hann};

% now put these defaults into the optArgs cell array, 
% and overwrite the ones specified in varargin.
optArgs(1:numVarArgs) = varargin;
% or ...
% [optargs{1:numvarargs}] = varargin{:};

% Place optional args in memorable variable names
[winFunction] = optArgs{:};

% Reference (correction matrix)
correctionMatrix = repmat((sampleArm ), [1 SSOctDefaults.nLinesPerFrame]);
% Normaliza by the reference????
correctedBscan = (double(rawBscan) - correctionMatrix);
% Apply window to the interferogram
correctedBscan = correctedBscan.*repmat(winFunction(SSOctDefaults.NSAMPLES), ...
    [1 SSOctDefaults.nLinesPerFrame]);
