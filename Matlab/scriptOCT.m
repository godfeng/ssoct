%% Preprocess .bin files to .mat +.dat
cd('D:\Edgar\Documents\FDOCT\EdwardOCT\Reconstruction 2')
OCT_processor

%% Reconstruction of .dat files to .dop3D .struct3D
clear
main_reconstruction

%% Map files to memory
clear
map_3D_files

%% 
% Minimum & maximum values to display structureal data
minVal = min(Doppler1.Data.Data(:));
maxVal = max(Doppler1.Data.Data(:));

%%
load('D:\Edgar\Documents\FDOCT\EdwardOCT\Reconstruction 2\doppler_color_map.mat')
xTicks = recons_info.step(1)*[1:recons_info.size(1)];
zTicks = recons_info.step(2)*[1:recons_info.size(2)];
figure;
for iFrames=30:30,
    imagesc(xTicks,zTicks,squeeze(Doppler1.Data.Data(:,:,iFrames))'); 
    colormap(doppler_color_map);
%     colormap(gray)
    xlabel([recons_info.type(1) ' [um]'])
    ylabel([recons_info.type(2) ' [um]'])
    colorbar
    title(sprintf('Frame %d.',iFrames))
    pause(0.01)
end

%% Structural data
acqui_info.nframes = 100;
mMode = zeros(recons_info.size(2),recons_info.size(1)*recons_info.size(3));
% We choose the x-slice
sliceNo = 500;
% for iFrames=1:acqui_info.nframes,
for iFrames=1:100,
    for iLines = 1:recons_info.size(1)
        mMode(:,(iFrames-1)*840 + iLines) = Structure.Data.Data(iLines,:,iFrames);
    end
end
figure;
% imagesc(acqui_info.framenumber,zTicks,mMode); colormap(gray(255)); colorbar
imagesc(mMode); colormap(gray(255)); colorbar
title(sprintf('x-slice No: %d',sliceNo))
xlabel('Frames')
ylabel([recons_info.type(2) ' [um]'])

%% Doppler data
mMode = zeros(recons_info.size(2),recons_info.size(1)*recons_info.size(3));
% We choose the x-slice
sliceNo = 550;
for iFrames=1:acqui_info.nframes,
% for iFrames=1:100,
    for iLines = 1:recons_info.size(1)
        mMode(:,(iFrames-1)*840 + iLines) = Doppler1.Data.Data(iLines,:,iFrames);
    end
end
figure;
% imagesc(acqui_info.framenumber,zTicks,mMode); colormap(doppler_color_map); colorbar
imagesc(mMode); colormap(doppler_color_map); colorbar
title(sprintf('Doppler x-slice No: %d',sliceNo))
xlabel('Frames')
ylabel([recons_info.type(2) ' [um]'])

%% ECG signal (control signal applied to the coil)
figure;
ECGsignal = acqui_info.ecg_signal{1,1}(:);
plot(ECGsignal)
% Sampling frequency of ECG signal
freqECG = size(acqui_info.ecg_signal{1,1},1) / ...
    (acqui_info.dat_size(2)*acqui_info.line_period_us*1e-6);

%% Frame rate (in Hz)
lineFreq = 1/(acqui_info.line_period_us*1e-6);
frameRate = lineFreq/acqui_info.dat_size(2);

%% FFT of ECG
[Y,f] = myFFT(double(ECGsignal), freqECG);
xlim([0 100])
%% FFT of M-mode image
averageSignal = mean(mMode(125:350,:));
[Y,f] = myFFT(averageSignal, lineFreq);
xlim([0 100])
