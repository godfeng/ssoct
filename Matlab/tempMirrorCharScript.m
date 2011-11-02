%% tempMirrorCharScript
% Clear global data
clear global SSOctDefaults
% Load default parameters
ss_oct_get_defaults
% Access global variable
global SSOctDefaults
SSOctDefaults.resampleData = false;
dirExp = 'D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\2011_10_28_Mirror\18_07_47_TestInterp';
mappedFile = readOCTmapFile(fullfile(dirExp,'2011_10_28_18_09_25.dat'));
load(fullfile(dirExp,'Reference_Measurements.mat'));
clear refArm sampleArm

%% Interpolation and resampling
rawBscan = double(squeeze(mappedFile.Data.rawData(:,:,end-1)));
% Update reference A-line
SSOctDefaults.refArm = mean(rawBscanRef,2);
correctedBscan = correct_B_scan(rawBscan,@hann,'true');
resampledRawBscan   = resample_B_scan(rawBscan);
resampledRawBscanRef = resample_B_scan(rawBscanRef);
% Update reference A-line
SSOctDefaults.refArm = mean(resampledRawBscanRef,2);
resampledCorrectedBscan = correct_B_scan(resampledRawBscan,@hann,'true');

%% Figures of interferograms
figure; set(gcf,'color','w')
subplot(231)
imagesc(rawBscanRef,[0 2^14]); 
colormap(flipud(gray(255))); colorbar; title('Reference B-scan')
subplot(232)
imagesc(rawBscan,[0 2^14]); 
colormap(flipud(gray(255))); colorbar; title('Raw B-scan')
subplot(233)
imagesc(correctedBscan,[-2^13 2^13]); 
colormap(flipud(gray(255))); colorbar; title('Corrected B-scan')
subplot(234)
imagesc(resampledRawBscanRef,[0 2^14]); 
colormap(flipud(gray(255))); colorbar; title('Resampled Reference B-scan')
subplot(235)
imagesc(rawBscan,[0 2^14]); 
colormap(flipud(gray(255))); colorbar; title('Resampled B-scan')
subplot(236)
imagesc(resampledCorrectedBscan,[-2^13 2^13]); 
colormap(flipud(gray(255))); colorbar; title('Resampled Corrected B-scan')

%% Example of interpolation
figure; plot(1e9*SSOctDefaults.vectorLambda,mean(correctedBscan,2),'k-',...
   1e9* SSOctDefaults.vectorLambda,mean(resampledCorrectedBscan,2),'r:'); 
legend('Original Interferogram','Resampled Interferogram'); set(gcf,'color','w')
xlabel('\lambda [nm]')

%% Structural data
%  A-line obtained from average along the rows [NSAMPLES 1]
struct2D = BmodeScan2struct(correctedBscan);
resampledStruct2D = BmodeScan2struct(resampledCorrectedBscan);
Aline = BmodeScan2struct(mean(correctedBscan,2));
resampledAline = BmodeScan2struct(mean(resampledCorrectedBscan,2));
AlineRight = Aline(SSOctDefaults.NSAMPLES/2 + 1 :SSOctDefaults.NSAMPLES);
AlineLeft = Aline (SSOctDefaults.NSAMPLES/2 :-1 :1);
resampledAlineRight = resampledAline(SSOctDefaults.NSAMPLES/2 + 1 :SSOctDefaults.NSAMPLES);
resampledAlineLeft = resampledAline (SSOctDefaults.NSAMPLES/2 :-1 :1);

%% Figures and FWHM computation
figure; set(gcf,'color','w');
plot(1:SSOctDefaults.NSAMPLES,Aline,'k-',...
    1:SSOctDefaults.NSAMPLES,resampledAline,'r:'); 
legend('Original A-line','Resampled A-line'); 

figure; set(gcf,'color','w')
subplot(221)
[~, peak_pos, FWHMum, peak_pos_m] = fwhm(AlineRight);
plot(1e3*SSOctDefaults.positiveZaxis_air,AlineRight,'k-',...
    1e3*peak_pos_m,AlineRight(peak_pos),'ro')
legend('Original (Right side)')
title([sprintf('FWHM = %.2f',FWHMum) ' \mum'])
xlabel('z [mm]')
subplot(222)
[~, peak_pos, FWHMum, peak_pos_m] = fwhm(AlineLeft);
plot(1e3*SSOctDefaults.positiveZaxis_air,AlineLeft,'k-',...
    1e3*peak_pos_m,AlineLeft(peak_pos),'ro')
legend('Original (Left side)')
title([sprintf('FWHM = %.2f',FWHMum) ' \mum'])
xlabel('z [mm]')
subplot(223)
[~, peak_pos, FWHMum, peak_pos_m] = fwhm(resampledAlineRight);
plot(1e3*SSOctDefaults.positiveZaxis_air,resampledAlineRight,'k-',...
    1e3*peak_pos_m,resampledAlineRight(peak_pos),'ro')
legend('Resampled (Right side)')
title([sprintf('FWHM = %.2f',FWHMum) ' \mum'])
xlabel('z [mm]')
subplot(224)
[~, peak_pos, FWHMum, peak_pos_m] = fwhm(resampledAlineLeft);
plot(1e3*SSOctDefaults.positiveZaxis_air,resampledAlineLeft,'k-',...
    1e3*peak_pos_m,resampledAlineLeft(peak_pos),'ro')
legend('Resampled (Left side)')
title([sprintf('FWHM = %.2f',FWHMum) ' \mum'])
xlabel('z [mm]')

%% 

% Clear global data
clear global SSOctDefaults
% Load default parameters
ss_oct_get_defaults
% Access global variable
global SSOctDefaults
close all
% ------------------------------------------------------------------------------
Fs = 125e6;                             % Sampling frequency = 125 MHz
[rawBscan refBscan Bscan hFig] = browseVolume(1,...
    'D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\2011_10_31_Mirror\17_35_18_darkNoise\2011_10_31_17_44_34.dat');
[Aline,f] = myFFT(mean(rawBscan,2), Fs);
% Pixel spacing in frequency
pixSpace = mean(diff(f));
[FWHM, peak_pos, FWHMum, peak_pos_m] = fwhm(Aline);
% plot(f,Aline,'k-',peak_pos*pixSpace,FWHM*pixSpace,'ro')
% title(sprintf('FWHM = %.2f Hz at %.2f Hz',FWHM*pixSpace,f(peak_pos)))
% xlabel('f [Hz]')
% xlim([0 15e6])

[rawBscan refBscan Bscan hFig] = browseVolume(1,...
    'D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\2011_10_31_Mirror\17_50_26_readoutNoise\2011_10_31_17_51_29.dat');
[Aline,f] = myFFT(mean(rawBscan,2), Fs);
% Pixel spacing in frequency
pixSpace = mean(diff(f));
[FWHM, peak_pos, FWHMum, peak_pos_m] = fwhm(Aline);
% plot(f,Aline,'k-',peak_pos*pixSpace,FWHM*pixSpace,'ro')
% title(sprintf('FWHM = %.2f Hz at %.2f Hz',FWHM*pixSpace,f(peak_pos)))
% xlabel('f [Hz]')
% xlim([0 15e6])

[rawBscan refBscan Bscan hFig] = browseVolume(1,...
    'D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\2011_10_31_Mirror\17_57_01_referenceLight\2011_10_31_17_57_56.dat');
[Aline,f] = myFFT(mean(refBscan,2), Fs);
% Pixel spacing in frequency
pixSpace = mean(diff(f));
[FWHM, peak_pos, FWHMum, peak_pos_m] = fwhm(Aline);
% plot(f,Aline,'k-',peak_pos*pixSpace,FWHM*pixSpace,'ro')
% title(sprintf('FWHM = %.2f Hz at %.2f Hz',FWHM*pixSpace,f(peak_pos)))
% xlabel('f [Hz]')
% xlim([0 15e6])

%% Comparison between 125 and 100 MHz. Mirror close to the surface
[rawBscan refBscan Bscan hFig] = browseVolume(1,...
    'D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\2011_10_31_Mirror\18_26_54_0000um\2011_10_31_18_29_21.dat');
[Aline,f] = myFFT(mean(rawBscan,2), Fs);
% Pixel spacing in frequency
pixSpace = mean(diff(f));
[FWHM, peak_pos, FWHMum, peak_pos_m] = fwhm(Aline);
% plot(f,Aline,'k-',peak_pos*pixSpace,FWHM*pixSpace,'ro')
% title(sprintf('FWHM = %.2f Hz at %.2f Hz',FWHM*pixSpace,f(peak_pos)))
% xlabel('f [Hz]')
% xlim([0 15e6])


% ------------------------------------------------------------------------------
% Mirror close to the surface but acquired at 100 MHz
Fs100 = 100e6;                             % Sampling frequency = 100 MHz
[rawBscan100 refBscan100 Bscan100 hFig] = browseVolume(1,...
    'D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\2011_11_01_Mirror\13_33_23_acq100MHz\2011_11_01_13_34_21.dat');
[Aline100,f100] = myFFT(mean(rawBscan100,2), Fs100);
% Pixel spacing in frequency
pixSpace100 = mean(diff(f100));
[FWHM100, peak_pos100, FWHMum100, peak_pos_m100] = fwhm(Aline100);
% plot(f100,Aline100,'k-',peak_pos100*pixSpace100,FWHM100*pixSpace100,'ro',...
%     f,Aline,'b-',peak_pos*pixSpace,FWHM*pixSpace,'go')
% title(sprintf('FWHM100 = %.2f Hz at %.2f Hz. FWHM125 = %.2f Hz at %.2f Hz',FWHM100*pixSpace100,f100(peak_pos100),...
%     FWHM*pixSpace,f(peak_pos)))
% legend({'@100MHz' '@100MHz' '@125MHz' '@125MHz'})

[refAline,~] = myFFT(mean(refBscan,2), Fs);
[refAline100,~] = myFFT(mean(refBscan100,2), Fs100);

figure; set(gcf,'color','w')
plot(f100,Aline100,'k-',f,Aline,'r-',f100,refAline100,'k:',f,refAline,'r:')
legend({'Mirror @100MHz' 'Mirror @125MHz' 'Reference @100MHz' 'Reference @125MHz'})
xlabel('f [Hz]')
xlim([0 12e6])
ylim([0 1.5e3])

figure; set(gcf,'color','w')
plot(f100,Aline100-refAline100,'k-',f,Aline-refAline,'r-')
legend({'Mirror-Ref @100MHz' 'Mirror-Ref @125MHz'})
xlabel('f [Hz]')
xlim([0 12e6])
ylim([0 1.5e3])

tilefigs
