% Script to characterize the system, a mirror is imaged at 51 different
% distances from zero path difference up to 3 mm. Then a dispersion optimization
% algorithm is applied.
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Mol�culaire
%                    �cole Polytechnique de Montr�al
% Edgar Guevara
% 2011/10/03

%% Data loading
% Add path to Edward's code
addpath(genpath('D:\Edgar\Documents\FDOCT\'))

% Load default parameters
ss_oct_get_defaults
global SSOctDefaults

% Directory
SSOctDefaults.dirCurrExp = 'D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\Mirror_Characterization';

% Get fileName
[fileName pathName] = uigetfile('*.dat','Choose a file',SSOctDefaults.dirCurrExp,...
    'MultiSelect', 'on');

% Read acquisition parameters generated by LabView
SSOctDefaults.acqParam = readCSVfile(fullfile(pathName, SSOctDefaults.acqParamFileName));
        
% Load reference and self-interference terms
load(fullfile(SSOctDefaults.dirCurrExp,'Reference_Measurements.mat'))
SSOctDefaults.sampleArm = sampleArm;
SSOctDefaults.refArm    = refArm;

%% Change format from double to uint16
% nFiles = size(fileName,2);
% for iFiles = 1:nFiles,
%     fid = fopen(fileName{iFiles},'rb'); % open file in binary read mode
%     % Read data in 'double' format
%     A16 = uint16(fread(fid,SSOctDefaults.NSAMPLES*SSOctDefaults.nLinesPerFrame*...
%         SSOctDefaults.nFrames,'double'));
%     fclose(fid);
%     fid = fopen(fullfile(SSOctDefaults.dirCurrExp,fileName{iFiles}),'w+b'); % open file in binary write mode
%     fwrite(fid, A16, 'uint16');         % Write uint16 data
%     fclose(fid);
% end

%% Process B-scans from mirrors
% Preallocate variables for speed
nFiles = size(fileName,2);
rawBscan = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame nFiles]);
correctBscan = zeros(size(rawBscan));
Bscan = zeros(size(correctBscan));
Alines = zeros([SSOctDefaults.NSAMPLES nFiles]);
tic
for iFiles = 1:nFiles,
    % Map file to memory
    A = readOCTmapFile(fullfile(pathName,fileName{iFiles}));
    % Get raw data (always last frame)
    rawBscan(:,:,iFiles) = squeeze(A.Data.rawData(:,:,3));
    % Subtract reference and self-interference terms; apply hann window
    correctBscan(:,:,iFiles) = correct_B_scan(rawBscan(:,:,iFiles),@hann,true);
    % Get reflectance profile from interferogram
    Bscan(:,:,iFiles) = BmodeScan2struct(squeeze(correctBscan(:,:,iFiles)));
    % Average all A-lines from each B-scan
    Alines(:,iFiles) = mean(squeeze(Bscan(:,:,iFiles)),2);
end
toc
% Keep only positive side
Alines = Alines(SSOctDefaults.NSAMPLES/2+1:end,:);
% Normalize peaks by their maximum amplitude
Alines = Alines ./ repmat(max(Alines),[SSOctDefaults.NSAMPLES/2 1]);

%% Plot A-lines
figure;
for iFiles = 1:nFiles,
    plot(SSOctDefaults.zAxis(1:2:end), Alines(:,iFiles));
    title(sprintf('File: %d',iFiles))
    pause(0.5)
end

%% Find peaks and FWHM
[FWHM,peak_pos] = calculate_FWHM(Alines);
figure;
plot(FWHM); title('FWHM')

%%
% Display B-scan
% 
% figure
% % Display in linear scale, single-sided FFT, with z-axis in um
% imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis,...
%     Bscan(SSOctDefaults.NSAMPLES/2+1:end,:))
% axis tight
% colormap(gray(255))
% % title(sprintf('Continuous Transfer. Frame %d',iFrames))
% ylabel('z [mm]')
% xlabel('A-lines')
% colorbar

%% Implement dispersion compensation



% ==============================================================================
% [EOF]
