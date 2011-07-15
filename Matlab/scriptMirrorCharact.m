%% 

% Load default parameters
ss_oct_get_defaults
global SSOctDefaults

% 3 frames for mirrors
SSOctDefaults.nFrames = 3;

% Load reference values
load('D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\Mirror_Characterization\Reference_Measurements.mat')

%%
% Get filename
[filename pathname] = uigetfile('*.dat','Choose a file',SSOctDefaults.dirExp,...
    'MultiSelect', 'on');

%% 
nFiles = size(filename,2);
rawBscan = zeros([SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame nFiles]);
Bscan = zeros(size(rawBscan));
for iFiles = 1:nFiles,
    % Map file to memory
    A = memmapfile(fullfile(pathname,filename{iFiles}), 'format', 'double',...
        'writable', false);
    A.Format = {'double' [SSOctDefaults.NSAMPLES SSOctDefaults.nLinesPerFrame...
        SSOctDefaults.nFrames] 'rawData'};
    rawBscan(:,:,iFiles) = squeeze(A.Data.rawData(:,:,3));
    Bscan(:,:,iFiles) = BmodeScan2struct(squeeze(rawBscan(:,:,iFiles)));
end

%% CONTINUE HERE...


%%
% Display B-scan

figure
% Display in linear scale, single-sided FFT, with z-axis in um
imagesc(1:SSOctDefaults.nLinesPerFrame, 1e3*SSOctDefaults.zAxis,...
    Bscan(SSOctDefaults.NSAMPLES/2+1:end,:))
axis tight
colormap(gray(255))
% title(sprintf('Continuous Transfer. Frame %d',iFrames))
ylabel('z [mm]')
xlabel('A-lines')
colorbar


