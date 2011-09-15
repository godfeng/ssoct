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

% struct2D = abs(fftshift(ifft(double(Bmodescan),[],1)));
% FFT OR IFFT?????
struct2D = abs(ifftshift(fft(double(Bmodescan),[],1)));
% ==============================================================================
% [EOF]
