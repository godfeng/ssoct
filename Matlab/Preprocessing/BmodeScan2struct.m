function struct2D = BmodeScan2struct(Bmodescan)
% Creates structural data from a B-mode scan
% SYNTAX:
% struct2D = BmodeScan2struct(Bmodescan)
% INPUTS:
% Bmodescan     2D raw data (B-scan)
% OUTPUTS:
% struct2D      2D fft of a B-scan
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11
global ssOCTdefaults

% Complex median subtraction (works only on tissue/multiple scatterers)
if ssOCTdefaults.medianRefArm
    % Window function
    tmpCorrArray = myhann(ssOCTdefaults.nSamplesFFT);
    tmpCorrArray = tmpCorrArray(:,ones([size(Bmodescan,2) 1]));

    % Get complex data from B-scan
    fftBscan = fftshift(fft(double(Bmodescan),ssOCTdefaults.nSamplesFFT,1),1);

    % Get a median reference spectrum in Fourier domain
    refAline = median(real(fftBscan),2) + 1j*median(imag(fftBscan),2);
    refAline = refAline(:,ones([size(Bmodescan,2) 1]));
    
    % Apply hann function to reference
    refAline = refAline .* tmpCorrArray;

    % Subtract median reference in complex domain
    fftBscanCorr = fftBscan - refAline;

    % Get structural B-scan
    struct2D = abs(fftBscanCorr);
else

% FFT of the interferogram is a reflectivity profile, applying the FFT across
% the columns (dimension = 1), with ssOCTdefaults.nSamplesFFT points
struct2D = abs(fftshift(fft(double(Bmodescan),ssOCTdefaults.nSamplesFFT,1),1));

% struct2D = abs(fftshift(fft(double(Bmodescan),[],1),1)); % OLD WAY TO DO IT
end
% ==============================================================================
% [EOF]
