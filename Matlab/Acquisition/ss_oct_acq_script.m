%_______________________________________________________________________________
% Copyright (C) 2010 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Load default parameters
ss_oct_get_defaults
% Establish connection to socket server running on FPGA
connect2FPGA
% Flush data buffer of the connection
flush_data
% Send commands to test LEDs on the FPGA board
LED_test
% Take reference and sample measurement
[sampleArm, refArm] = reference_measure;
% Start continuous acquisition
cont_acq
% Disconnect from socket server
disconnect_from_FPGA

%===============================================================================
% EOF
