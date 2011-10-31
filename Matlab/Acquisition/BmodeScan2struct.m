function struct2D = BmodeScan2struct(Bmodescan)
% Creates structural data from a B-mode scan
% SYNTAX:
% struct2D = BmodeScan2struct(Bmodescan)
% INPUTS:
% Bmodescan     2D fft of a B-scan
% OUTPUTS:
% struct2D      2D raw data (B-scan)
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11
global SSOctDefaults

if SSOctDefaults.resampleData
    % K-clock resampling of a B-scan
    Bmodescan = resample_B_scan(Bmodescan);
end

% FFT of the interferogram is a reflectivity profile, applying the FFT across
% the columns (dimension = 1) 
struct2D = abs(ifftshift(fft(double(Bmodescan),[],1)));
% ==============================================================================
% [EOF]
