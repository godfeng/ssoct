function flush_data
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Read elements at the beginning of connection to flush buffer
flush = pnet(SSOctDefaults.tcpConn,'read',SSOctDefaults.MENUSIZE,'uint8');
% Show flushed data
disp(char(flush))

% ==============================================================================
% [EOF]
