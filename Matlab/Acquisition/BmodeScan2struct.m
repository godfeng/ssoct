function struct2D = BmodeScan2struct(Bmodescan)
% Creates structural data from a B-mode scan
% SYNTAX:
% struct2D = BmodeScan2struct(Bmodescan)
% INPUTS:
% Bmodescan     2D fft of a B-scan
% OUTPUTS:
% struct2D      2D raw data (B-scan)
%_______________________________________________________________________________
% Copyright (C) 2010 LIOM Laboratoire d'Imagerie Optique et Mol�culaire
%                    �cole Polytechnique de Montr�al
% Edgar Guevara
% 2011/07/11

struct2D = abs(ifftshift(fft(double(Bmodescan - 2^13),[],1)));
