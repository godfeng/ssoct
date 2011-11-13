function resampled_Bmodescan = resample_B_scan(Bmodescan)
% The assumption is that each A-line in the B scan is sampled at a fixed
% frequency, then it is interpolated using a known sampling function, obtained
% from the k-clock (swept source laser output)
% SYNTAX:
% resampled_Bmodescan = resample_B_scan(Bmodescan)
% INPUTS:
% Bmodescan: 2D image
% OUTPUTS:
% resampled_Bmodescan: non-linear sampling corrected along A-lines
%_______________________________________________________________________________
% Copyright (C) 2010 Laboratoire d'Imagerie Optique et Moleculaire
% Frederic Lesage, Edgar Guevara
% 2011/10/12

% Modifies values of global variable
global ssOCTdefaults

% Checking if Bmodescan is uint16
if isinteger(Bmodescan)                 
    Bmodescan = double(Bmodescan);
    FLAG_int = true;
else
    FLAG_int = false;
end

%%
% Position when sampling at a fixed frequency (125 MHz)
fixedSampling = linspace(0,ssOCTdefaults.NSAMPLES - 1,ssOCTdefaults.NSAMPLES)';
% Position with k-clock sampling (variable sampling frequency)
kClockSampling = ssOCTdefaults.kClockSampling;

% Filter the sampling to avoid problems
% filter_order = 50;
% a = 1;
% b = ones(1, filter_order)/filter_order;
% kClockSampling = filter(b,a,kClockSampling);


% first up-sampling the data
% nSamplesFFT = 2^nextpow2(2*ssOCTdefaults.NSAMPLES);
% using an FFT, zero padding and then performing IFFT.
% fixedSamplingFFT = fft(fixedSampling);
% kClockSampling = ifft(fft(kClockSampling,1170),nSamplesFFT);
% Usually two to four times up-sampling is sufficient for this application.

% fixedSampling = resample(fixedSampling,nSamplesFFT,ssOCTdefaults.NSAMPLES,FIRlength);
% kClockSampling = resample(kClockSampling,nSamplesFFT,ssOCTdefaults.NSAMPLES,FIRlength);

%%
% Resampling (Interpolation/Decimation) along columns (A-lines)
resampled_Bmodescan = interp1(kClockSampling, Bmodescan, fixedSampling, 'linear');

% Output Bmodescan is also an integer
if FLAG_int                             
    resampled_Bmodescan = uint16(resampled_Bmodescan);
end
