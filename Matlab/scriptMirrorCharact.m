% Script to characterize the system, a mirror is imaged at 51 different
% distances from zero path difference up to 3 mm. Then a dispersion optimization
% algorithm is applied.
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/19

%% Data loading
% Add path to Edward's code
addpath(genpath('D:\Edgar\Documents\FDOCT\'))

% Load default parameters
ss_oct_get_defaults
global SSOctDefaults

% 3 frames for mirrors
SSOctDefaults.nFrames = 3;

% Load reference values
load('D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\Mirror_Characterization\Reference_Measurements.mat')

% Get filename
[filename pathname] = uigetfile('*.dat','Choose a file',SSOctDefaults.dirCurrExp,...
    'MultiSelect', 'on');

% Load reference and self-interference terms
load('D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\Mirror_Characterization\Reference_Measurements.mat')
SSOctDefaults.sampleArm = sampleArm;
SSOctDefaults.refArm    = refArm;

%% Process B-scans from mirrors
% Preallocate variables for speed
nFiles = size(filename,2);
rawBscan = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame nFiles]);
Bscan = zeros(size(rawBscan));
Alines = zeros([SSOctDefaults.NSAMPLES nFiles]);
tic
for iFiles = 1:nFiles,
    % Map file to memory
    A = memmapfile(fullfile(pathname,filename{iFiles}), 'format', 'double',...
        'writable', false);
    A.Format = {'double' [SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame...
        SSOctDefaults.nFrames] 'rawData'};
    % Get raw data (always last frame)
    rawBscan(:,:,iFiles) = squeeze(A.Data.rawData(:,:,3));
    % Subtract reference and self-interference terms; apply hann window
    rawBscan(:,:,iFiles) = correct_B_scan(rawBscan(:,:,iFiles),@hann,true);
    % Get reflectance profile from interferogram
    Bscan(:,:,iFiles) = BmodeScan2struct(squeeze(rawBscan(:,:,iFiles)));
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
