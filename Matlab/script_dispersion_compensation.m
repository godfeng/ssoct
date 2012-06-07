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

%%
% Structural image
structBscan = abs(fftBscan);
minVal = min(structBscan(:));
maxVal = max(structBscan(:));

for iDirs = 1:numel(dirList)
    figure(1); imagesc(squeeze(structBscan(:,:,iDirs)), [minVal maxVal]); 
    title(iDirs); pause(0.25);
end

%% Dispersion compensation maximization

% frame_before_dispersion=abs(ifft(frame,[],1));
% figure(1);subplot(2,1,1);imagesc(frame_before_dispersion(50:200,:))
% title('Frame before dispersion compensation');pause(0.01)

if ssOCTdefaults.dispersion.compensate,
    ssOCTdefaults.dispersion.a = fminsearch(@(a) dispersion_optim(frame,wavenumbers,a),dispersion.a);
    ssOCTdefaults.dispersion.compensate = false;
    save last_dispersion_parameter -struct ssOCTdefaults.dispersion
end

[frame] = dispersion_comp(frame,wavenumbers,dispersion.a);

