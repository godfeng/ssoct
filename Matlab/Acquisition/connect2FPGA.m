function connect2FPGA
% Establishes connection to FPGA-based simple socket server 
% SYNTAX:
% connect2FPGA
% INPUTS:
% None
% OUTPUTS:
% None
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Creates tcp/ip connection to the specified 'hostname' and port
SSOctDefaults.tcpConn = pnet('tcpconnect',SSOctDefaults.serverAddress,SSOctDefaults.portNumber );
% Necessary pause
pause(0.1);
% specifies how long read and listen commands blocks before it timeouts.
pnet(SSOctDefaults.tcpConn,'setreadtimeout',0.25);
pnet(SSOctDefaults.tcpConn,'setwritetimeout',0.1);
fprintf('Connection established to %s at port %d\n',SSOctDefaults.serverAddress,SSOctDefaults.portNumber)

% ==============================================================================
% [EOF]
