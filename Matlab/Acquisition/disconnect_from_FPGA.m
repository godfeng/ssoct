function disconnect_from_FPGA
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Mol�culaire
%                    �cole Polytechnique de Montr�al
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Change timeouts
pnet(SSOctDefaults.tcpConn,'setreadtimeout',1)
pnet(SSOctDefaults.tcpConn,'setwritetimeout',1);
   
% Closes a tcpconnection (send first a 'Q\n\r')
pnet(SSOctDefaults.tcpConn,'write',[uint8(81) uint8(10) uint8(13)]);
% Receive 35+2 characters from FPGA
textReceived = uint8(swapbytes(pnet(SSOctDefaults.tcpConn,'read',[37 1],'uint8')));
if ~isempty(textReceived)
    disp(char(textReceived'))
end
% pause(0.1);
pnet(SSOctDefaults.tcpConn,'close')
fprintf('Connection closed from %s at port %d\n',SSOctDefaults.serverAddress,SSOctDefaults.portNumber)
% Closes all pnet connections/sockets used in this matlab session.
pnet('closeall')

% Kill NIOS terminal
[~,~] = system('taskkill /F /FI "IMAGENAME eq nios2*"');
% Kill NIOS task
[~,~] = system('taskkill /F /FI "IMAGENAME eq bash*"');
% Kill Quartus programmer task
[~,~] = system('taskkill /F /FI "IMAGENAME eq quartus*"');

% ==============================================================================
% [EOF]
