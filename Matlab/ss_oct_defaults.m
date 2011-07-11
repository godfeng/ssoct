function ss_oct_defaults
% Loads default values most common spm_lot variables to SSOctDefaults structure,
% as a global variable
% SYNTAX:
% ss_oct_defaults
% INPUTS:
% None
% OUTPUTS:
% None:  Just a global structure containing defaults values of common spm_lot 
%        variables named SSOctDefaults
% Care must be taken when modifying this file!
%_______________________________________________________________________________
% Copyright (C) 2010 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Default values for ss_oct in structure SSOctDefaults
global SSOctDefaults

% Directories & file names
%===============================================================================
% Installation directory
SSOctDefaults.dirUser = 'D:\Edgar\Documents\ssoct\Matlab\';
% Experiments data directory
SSOctDefaults.dirExp = 'D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\';
% Maximize figure
SSOctDefaults.screenSize = get(0,'Screensize');
SSOctDefaults.screenSize = [1 40 SSOctDefaults.screenSize(3) SSOctDefaults.screenSize(4)-40];

% SS-OCT experiment specific variables
%===============================================================================
% Server machine (FPGA)
SSOctDefaults.serverAddress   = '192.168.1.234';
SSOctDefaults.portNumber      = 30;
% Number of samples per A-line
SSOctDefaults.NSAMPLES        = 1170;
% Tx & Rx buffer size for all socket sends & receives
SSOctDefaults.BUFFERSIZE      = 9000;
% Number of characters of startup menu
SSOctDefaults.MENUSIZE        = 351;
% Save to file
SSOctDefaults.save2file       = false;
% Number of A-lines per frame
SSOctDefaults.nLinesPerFrame = 840;
% Number of frames per B-scan
SSOctDefaults.nFrames = 400;
% Number of total samples per B-scan
SSOctDefaults.nAcqSamples = SSOctDefaults.nLinesPerFrame*SSOctDefaults.nFrames;


