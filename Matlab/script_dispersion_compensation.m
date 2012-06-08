%% script_dispersion_compensation
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
    figure(1); imagesc(rawBscan, [0 2^14]); title(tVar); pause(0.1);
end
mirrorPos = str2num(cell2mat(varNames)); %#ok<ST2NM>

%% Structural image
structBscan = abs(fftBscan);
minVal = min(structBscan(:));
maxVal = max(structBscan(:));

for iDirs = 1:numel(dirList)
    figure(1); imagesc(squeeze(structBscan(:,:,iDirs)), [minVal maxVal]); 
    title(iDirs); pause(0.25);
end


%% FWHM computing of uncompensated data
Aline = zeros([ssOCTdefaults.nSamplesFFT/2 numel(dirList)]);
FWHM = zeros([numel(dirList) 1]);
peak_pos = zeros([numel(dirList) 1]);
FWHM_um = zeros([numel(dirList) 1]);
peak_pos_m = zeros([numel(dirList) 1]);
for iDirs = 1:numel(dirList),
    tempBscan = mean(squeeze(fftBscan(:,:,iDirs)),2);
    Aline(:,iDirs) = abs(tempBscan);
    [FWHM(iDirs), peak_pos(iDirs), FWHM_um(iDirs), peak_pos_m(iDirs)] = fwhm(Aline(:,iDirs));
end
figure(2); plot(1e3*ssOCTdefaults.range.posZaxis_air, Aline(:,1:18));figure(gcf); 
xlabel('z [mm]'); ylabel('Amplitude'); 
title('A-lines before dispersion compensation')
figure(3); plot(1e3*peak_pos_m(1:18,1),FWHM_um(1:18,1),'k.');figure(gcf); 
xlabel('Peak position [mm]'); ylabel('FWHM [\mum]'); 
title('FWHM width before dispersion compensation')

%% Dispersion compensation maximization

% frame_before_dispersion=abs(ifft(frame,[],1));
% figure(1);subplot(2,1,1);imagesc(frame_before_dispersion(50:200,:))
% title('Frame before dispersion compensation');pause(0.01)
tic
BscanDisp = zeros(size(Bscan));
for iDirs = 1:numel(dirList),
    frame = squeeze(Bscan(:,:,iDirs));
    % Get pixels in k-space and linear space from lambda vector
    wavenumbers = lambda2k(ssOCTdefaults.range.vectorLambda);
    a = ssOCTdefaults.dispersion.a;
    if ssOCTdefaults.dispersion.compensate,
        a = fminsearch(@(a) dispersion_optim(frame,wavenumbers,a), a);
%         ssOCTdefaults.dispersion.compensate = false;
        % save last_dispersion_parameter -struct ssOCTdefaults.dispersion
        ssOCTdefaults.dispersion.a = a;
    end
    BscanDisp(:,:,iDirs) = dispersion_comp(frame,wavenumbers,ssOCTdefaults.dispersion.a);
end
toc

%% Analysis of dispersion-compensated data
fftBscanDisp = zeros(size(fftBscan));
for iDirs = 1:numel(dirList),
    % Bscan in Fourier space 
    fftBscanDisp(:,:,iDirs) = Bscan2FFT(squeeze(BscanDisp(:,:,iDirs)));
end

%% FWHM computing of uncompensated data
AlineDisp = zeros([ssOCTdefaults.nSamplesFFT/2 numel(dirList)]);
FWHMDisp = zeros([numel(dirList) 1]);
peak_posDisp = zeros([numel(dirList) 1]);
FWHM_umDisp = zeros([numel(dirList) 1]);
peak_pos_mDisp = zeros([numel(dirList) 1]);
for iDirs = 1:numel(dirList),
    tempBscanDisp = mean(squeeze(fftBscanDisp(:,:,iDirs)),2);
    AlineDisp(:,iDirs) = abs(tempBscanDisp);
    [FWHMDisp(iDirs), peak_posDisp(iDirs), FWHM_umDisp(iDirs), peak_pos_mDisp(iDirs)] = fwhm(AlineDisp(:,iDirs));
end
figure(4); plot(1e3*ssOCTdefaults.range.posZaxis_air, AlineDisp(:,1:18));figure(gcf); 
xlabel('z [mm]'); ylabel('Amplitude'); 
title('A-lines after dispersion compensation')
figure(5); plot(1e3*peak_pos_mDisp(1:24,1),FWHM_umDisp(1:24,1),'k.');figure(gcf); 
xlabel('Peak position [mm]'); ylabel('FWHM [\mum]'); 
title('FWHM width after dispersion compensation')
