%% script_dispersion_compensation
clc; close all
% Get directory list
% Clear global data
clear global ssOCTdefaults
% Load default parameters
ss_oct_get_defaults
% Access global variable
global ssOCTdefaults
clear dirList
% Get directories list
batch_dir_list;
% Interpolate the samples in k-space
ssOCTdefaults.resampleData = true;
dirExp = 'D:\Edgar\ssoct\Matlab\Acquisition\DATA\2012_06_06_Dispersion_Compensation_Mirror';

%%  Read and map files to memory
nameDirs = cell(size(dirList));
varNames = cell(size(dirList));
Bscan = zeros([ssOCTdefaults.NSAMPLES 512 length(dirList)]);
fftBscan = zeros([ssOCTdefaults.nSamplesFFT/2 512 length(dirList)]);
for iDirs = 1:numel(dirList)
    % Get the folder names
    [pathstr, nameDirs{iDirs}, ext] = fileparts(dirList{iDirs});
    % Match 4 consecutive numbers
    varNames(iDirs) = regexp(nameDirs{iDirs}, '\d{4}','match');
    % Create the variable name to save the mapped file
    tVar = strcat('m', varNames{iDirs});
    % List all the .dat files in current directoryu
    datFiles = dir(fullfile(dirList{iDirs}, '*.dat'));
    % Get full file name
    fullFileName = fullfile(dirList{iDirs}, datFiles(1).name);
    % Map to memory the first file only, not the reference
    eval( [tVar ' = readOCTmapFile(fullFileName);'] );
    % Get a single frame
    rawBscan = eval(['squeeze(' tVar '.Data.rawData(:,:,5))']);
    % Subtracts the reference signal, resamples the data in k-space and applies
    % windowing function, for a single frame
    Bscan(:,:,iDirs) = correct_B_scan(rawBscan,@hann,'sub');
    % Bscan in Fourier space 
    fftBscan(:,:,iDirs) = Bscan2FFT(squeeze(Bscan(:,:,iDirs)));
    % Displays current B-frame
%     figure(1); imagesc(rawBscan, [0 2^14]); title(tVar); pause(0.05);
end
mirrorPos = str2num(cell2mat(varNames)); %#ok<ST2NM>

%% Structural image
structBscan = abs(fftBscan);
minVal = min(structBscan(:));
maxVal = max(structBscan(:));
mirrorsRange = 1:18;                % Range of depths (usually up to 18)
% for iDirs = mirrorsRange,
%     figure(1); imagesc(squeeze(structBscan(:,:,iDirs)), [minVal maxVal]); 
%     title(iDirs); pause(0.05);
% end

%% FWHM computing of uncompensated data

AlineRange = 1:512;
Aline = zeros([ssOCTdefaults.nSamplesFFT/2 numel(dirList)]);
FWHM = zeros([numel(dirList) 1]);
peak_pos = zeros([numel(dirList) 1]);
FWHM_um = zeros([numel(dirList) 1]);
peak_pos_m = zeros([numel(dirList) 1]);
for iDirs = mirrorsRange,
    Aline(:,iDirs) = abs(mean(squeeze(fftBscan(:,AlineRange,iDirs)),2));
    [FWHM(iDirs), peak_pos(iDirs), FWHM_um(iDirs), peak_pos_m(iDirs)] = fwhm(Aline(:,iDirs));
%     Aline(:,iDirs) = Aline(:,iDirs) ./ max(Aline(:,iDirs));
end
figure(2); subplot(221);
plot(1e3*ssOCTdefaults.range.posZaxis_air, Aline(:,mirrorsRange));figure(gcf); 
xlabel('z [mm]'); ylabel('Normalized Amplitude'); 
title('A-lines before dispersion compensation')
figure(2); subplot(212);
plot(1e3*peak_pos_m(mirrorsRange,1),FWHM_um(mirrorsRange,1),'kx');figure(gcf);
ylim([10 60]);
xlabel('Peak position [mm]'); ylabel('FWHM [\mum]'); 
title('FWHM width before/after dispersion compensation')

%% Dispersion compensation maximization

% frame_before_dispersion=abs(ifft(frame,[],1));
% figure(1);subplot(2,1,1);imagesc(frame_before_dispersion(50:200,:))
% title('Frame before dispersion compensation');pause(0.01)

tic
fprintf('Dispersion compensation started \n');
BscanDisp = zeros(size(Bscan));
aVector = zeros([2 numel(dirList)]);
for iDirs = mirrorsRange,
    frame = squeeze(Bscan(:,:,iDirs));
    % Get pixels in k-space and linear space from lambda vector
    wavenumbers = lambda2k(ssOCTdefaults.range.vectorLambda);
    % a = ssOCTdefaults.dispersion.a;
    if ssOCTdefaults.dispersion.compensate,
        a = [0; 0];             % Initialize value
        a = fminsearch(@(a) dispersion_optim(frame,wavenumbers,a), a);
        aVector(:,iDirs) = a;
        % ssOCTdefaults.dispersion.compensate = false;
        % save last_dispersion_parameter -struct ssOCTdefaults.dispersion
        % ssOCTdefaults.dispersion.a = a;
    end
    BscanDisp(:,:,iDirs) = dispersion_comp(frame,wavenumbers,a);
    fprintf('Mirror %d of %d done! \n',iDirs,numel(mirrorsRange));
end
dispEtime(toc)

%% Analysis of dispersion-compensated data
fftBscanDisp = zeros(size(fftBscan));
for iDirs = mirrorsRange,
    % Bscan in Fourier space 
    fftBscanDisp(:,:,iDirs) = Bscan2FFT(squeeze(BscanDisp(:,:,iDirs)));
end

%% FWHM computing of compensated data
AlineDisp = zeros([ssOCTdefaults.nSamplesFFT/2 numel(dirList)]);
FWHMDisp = zeros([numel(dirList) 1]);
peak_posDisp = zeros([numel(dirList) 1]);
FWHM_umDisp = zeros([numel(dirList) 1]);
peak_pos_mDisp = zeros([numel(dirList) 1]);
for iDirs = mirrorsRange,
    AlineDisp(:,iDirs) = abs(mean(squeeze(fftBscanDisp(:,AlineRange,iDirs)),2));
    [FWHMDisp(iDirs), peak_posDisp(iDirs), FWHM_umDisp(iDirs), peak_pos_mDisp(iDirs)] = fwhm(AlineDisp(:,iDirs));
%     AlineDisp(:,iDirs) = AlineDisp(:,iDirs) ./ max(AlineDisp(:,iDirs));
end
figure(2); subplot(222);
plot(1e3*ssOCTdefaults.range.posZaxis_air, AlineDisp(:,mirrorsRange));figure(gcf); 
xlabel('z [mm]'); ylabel('Normalized Amplitude'); 
title('A-lines after dispersion compensation')
figure(2); subplot(212);
hold on
plot(1e3*peak_pos_mDisp(mirrorsRange,1),FWHM_umDisp(mirrorsRange,1),'ro');figure(gcf);
legend({'Before D.C.' 'After D.C.'}, 'Location', 'SouthEast')

