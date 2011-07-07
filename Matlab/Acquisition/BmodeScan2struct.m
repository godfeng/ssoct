function struct2D = BmodeScan2struct(Bmodescan)
% Creates structural data from a B-mode scan
% SYNTAX:
% struct2D = BmodeScan2struct(Bmodescan)
% INPUTS:
% OUTPUTS:

struct2D = abs(ifftshift(fft(double(Bmodescan - 2^13),[],1)));
