function mappedFile = readOCTmapFile
% Maps a .dat file into memory
% SYNTAX:
% 
% INPUTS:
% 
% OUTPUTS:
% 
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/09/20

global SSOctDefaults
cd(SSOctDefaults.dirCurrExp)
mappedFile = memmapfile(SSOctDefaults.CurrExpFileName, 'format', 'double',...
    'writable', false);
mappedFile.Format = {'double' [SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame...
    SSOctDefaults.nFrames] 'rawData'};

% ==============================================================================
% [EOF]
