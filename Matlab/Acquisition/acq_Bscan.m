function Bscan  = acq_Bscan(varargin)
% SYNTAX:
% correctedBscan = correct_B_scan(rawBscan, windowType)
% INPUTS:
% [windowType]      Function handle to the window function to use:
%                   @barthannwin    @bartlett   @blackman   @blackmanharris
%                   @bohmanwin      @flattopwin @gausswin   @hamming
%                   @hann           @nuttallwin @parzenwin  @rectwin
%                   @taylorwin      @triang
% [correctBackground] if true, applies correction method to raw B-scan
% OUTPUTS:
% Bscan             set of A/lines, already windowed and corrected for
%                   background signal
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11


% Modifies values of global variable
global SSOctDefaults
% only want 2 optional inputs at most
numVarArgs = length(varargin);
if numVarArgs > 2
    error('correct_B_scan:TooManyInputs', ...
        'requires at most 1 optional input');
end

% set defaults for optional inputs (@hann window)
optArgs = {@hann true};

% now put these defaults into the optArgs cell array, 
% and overwrite the ones specified in varargin.
optArgs(1:numVarArgs) = varargin;
% or ...
% [optargs{1:numvarargs}] = varargin{:};

% Place optional args in memorable variable names
[winFunction correctBackground] = optArgs{:};

% Preallocate
Bscan = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame]);

for iLines = 1:SSOctDefaults.nLinesPerFrame,
    % Reads an array of NSAMPLES elements from a connection
    Bscan(:,iLines) = pnet(SSOctDefaults.tcpConn,'read',[SSOctDefaults.NSAMPLES 1],'int16');
    % Correct first sample (always zero, should know why)
    Bscan(1,iLines) = Bscan(2,iLines);
end
% CORRECTION ALGORITHM HERE!!!!
Bscan = correct_B_scan(Bscan,winFunction,correctBackground);
