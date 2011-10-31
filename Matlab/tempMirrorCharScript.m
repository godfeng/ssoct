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

