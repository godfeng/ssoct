load (fullfile('D:\Edgar\Documents\ssoct\Matlab\Misc','phase.mat'))
% load values to new variables
k0 = data.k;
Aline = data.Aline;
ref = data.refB;

% K-clock resampling of a B-scan
% Position when sampling at a fixed frequency (125 MHz)
fixedSampling = linspace(0,1128 - 1,1128)';

% Resampling (Interpolation/Decimation) along columns (A-lines)
Aline = interp1(k, Aline, fixedSampling, 'linear');
ref = interp1(k, ref, fixedSampling, 'linear');

% window
tmpCorrArray = myhann(1128);
Aline = Aline.*tmpCorrArray;
ref = ref.*tmpCorrArray;

% fourier transform on 4096 points
Afft = abs(fftshift(fft(double(Aline),4096,1),1));
Rfft = abs(fftshift(fft(double(ref),4096,1),1));

% Reference subtraction in fourier domain




