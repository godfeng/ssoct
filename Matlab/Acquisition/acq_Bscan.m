function [Bscan, varargout]  = acq_Bscan(varargin)
% Acquires a single B-scan (frame) of nLinesPerFrame
% SYNTAX:
% Bscan = acq_Bscan(windowType, correctBackground)
% INPUTS:
% [windowType]      Function handle to the window function to use:
%                   @barthannwin    @bartlett   @blackman   @blackmanharris
%                   @bohmanwin      @flattopwin @gausswin   @hamming
%                   @hann           @nuttallwin @parzenwin  @rectwin
%                   @taylorwin      @triang
% [correctBackground] if true, applies correction method to raw B-scan
% OUTPUTS:
% Bscan             raw set of A/lines
% [rawBscan16]      raw set of A/lines in uint16 format (to be saved to disk)  
% [correctedBscan]  B-scan windowed and corrected for background signal
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
        'requires at most 2 optional inputs');
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
rawBscan16 = uint16(zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame]));
%rxData = [];

for iLines = 1:SSOctDefaults.nLinesPerFrame,
    % Gives an "preview" of whats available, all data is left in the read
    % buffer. We check how much is available at the moment without blocking.
%     while numel(rxData) < SSOctDefaults.nBytesPerAline,
%         rxData = pnet(SSOctDefaults.tcpConn, 'read','view','noblock');
%     end
    
    % Reads an array of nWordsPerAline elements from a connection
    tempAline = pnet(SSOctDefaults.tcpConn,'read',[SSOctDefaults.nWordsPerAline 1],'uint16');
    % Only keep NSAMPLES from transmitted data array (transposed)
    Bscan(:,iLines) = tempAline(1:SSOctDefaults.NSAMPLES)';
    % B-scan saved as uint16
    rawBscan16(:,iLines) = tempAline(1:SSOctDefaults.NSAMPLES)';
end
% CORRECTION ALGORITHM HERE!!!!
if correctBackground
%     Bscan = correct_B_scan(Bscan,winFunction,correctBackground);
    % correctedBscan
    varargout{2} = correct_B_scan(Bscan,winFunction,correctBackground);
end
if nargout >= 2,
    varargout{1} = rawBscan16;
end
% ==============================================================================
% [EOF]
