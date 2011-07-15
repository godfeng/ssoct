function Bscan  = acq_Bscan
%_______________________________________________________________________________
% Copyright (C) 2010 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11


% Modifies values of global variable
global SSOctDefaults

% Preallocate
Bscan = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame]);

for iLines = 1:SSOctDefaults.nLinesPerFrame,
    % Reads an array of NSAMPLES elements from a connection
    Bscan(:,iLines) = pnet(SSOctDefaults.tcpConn,'read',[SSOctDefaults.NSAMPLES 1],'int16');
    % Correct first sample (always zero, should know why)
    Bscan(1,iLines) = Bscan(2,iLines);
end
% CORRECTION ALGORITHM HERE!!!!
% Bscan = correct_B_scan(Bscan);
