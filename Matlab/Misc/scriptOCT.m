%% Preprocess .bin files to .mat +.dat
cd('D:\Edgar\Documents\FDOCT\Reconstruction 2')
OCT_processor

%% Reconstruction of .dat files to .dop3D .struct3D
main_reconstruction

%% Map files to memory
clear
map_3D_files

%% 
load('D:\Edgar\Documents\FDOCT\Reconstruction 2\doppler_color_map.mat')
% Minimum & maximum values to display structureal data
minVal = min(Structure.Data.Data(:));
maxVal = max(Structure.Data.Data(:));

%%
xTicks = recons_info.step(1)*[1:recons_info.size(1)];
zTicks = recons_info.step(2)*[1:recons_info.size(2)];
figure;
for iFrames=1:acqui_info.nframes,
    imagesc(xTicks,zTicks,squeeze(Structure.Data.Data(:,:,iFrames))',[minVal maxVal]); colormap(gray(255));
    xlabel([recons_info.type(1) ' [um]'])
    ylabel([recons_info.type(2) ' [um]'])
    colorbar
    title(sprintf('Frame %d.',iFrames))
    pause(0.05)
end

%% Structural data
mMode = zeros(recons_info.size(2),recons_info.size(3));
% We choose the x-slice
sliceNo = 500;
for iFrames=1:acqui_info.nframes,
    mMode(:,iFrames) = Structure.Data.Data(sliceNo,:,iFrames);
end
figure;
imagesc(acqui_info.framenumber,zTicks,mMode); colormap(gray(255)); colorbar
title(sprintf('x-slice No: %d',sliceNo))
xlabel('Frames')
ylabel([recons_info.type(2) ' [um]'])

%% Doppler data
mMode = zeros(recons_info.size(2),recons_info.size(3));
% We choose the x-slice
sliceNo = 550;
for iFrames=1:acqui_info.nframes,
    mMode(:,iFrames) = Doppler1.Data.Data(sliceNo,:,iFrames);
end
figure;
imagesc(acqui_info.framenumber,zTicks,mMode); colormap(doppler_color_map); colorbar
title(sprintf('Doppler x-slice No: %d',sliceNo))
xlabel('Frames')
ylabel([recons_info.type(2) ' [um]'])

%% ECG signal (control signal applied to the coil)
figure;
plot(acqui_info.ecg_signal{1,1}(:))

%% Frame rate (in sec)
frameRate = acqui_info.dat_size(2)*acqui_info.line_period_us*1e-6;

%% FFT of M-mode image
% fftmMode


