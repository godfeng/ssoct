function disconnect_from_FPGA
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Closes a tcpconnection (send first a 'Q\n\r')
pnet(SSOctDefaults.tcpConn,'write',[uint8(81) uint8(10) uint8(13)]);
% Receive 35+2 characters from FPGA
textReceived = uint8(swapbytes(pnet(SSOctDefaults.tcpConn,'read',[37 1],'uint8')));
disp(char(textReceived'))
% pause(0.1);
pnet(SSOctDefaults.tcpConn,'close')
fprintf('Connection closed from %s at port %d\n',SSOctDefaults.serverAddress,SSOctDefaults.portNumber)

% Closes all pnet connections/sockets used in this matlab session.
% pnet('closeall')

% EOF
