% Main script to start acquisition from Swept Source-Optical Coherence
% Tomography system.
% SYNTAX:
% ss_oct_acq_script
% INPUTS:
% None
% OUTPUTS:
% None
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Mol�culaire
%                    �cole Polytechnique de Montr�al
% Edgar Guevara
% 2011/10/03

% Clear global data
clear global SSOctDefaults
% Load default parameters
ss_oct_get_defaults

%% ------------------------- MODIFY OPTIONS ------------------------------------
global SSOctDefaults
dbstop if error                         % Debug (Stop if error)
SSOctDefaults.displayLog        = false;
% Save files
SSOctDefaults.save2file         = true;
% Display single line/multiple lines in the interferogram plot
SSOctDefaults.displaySingleLine = true;
% Resample data in real-time
SSOctDefaults.resampleData      = false;
% Correct B-scan in real time
SSOctDefaults.corrBscan         = true;
% ------------------------------------------------------------------------------
% Read acquisition parameters generated by LabView
SSOctDefaults.acqParam = readCSVfile(fullfile(SSOctDefaults.dirExp,...
    SSOctDefaults.acqParamFileName));

%% Establish connection to socket server running on FPGA
connect2FPGA
% Flush data buffer of the connection
flush_data

%% Start continuous acquisition
cont_acq
% ==============================================================================
% [EOF]
