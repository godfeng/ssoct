% Correction script
[~,fileList] = system('dir D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\*.dat /s /b');

% Convert file list to cell

% Map file to memory
mappedFile = correctOCTmapFile(fileName);

% Keep only 1128 samples acquired @ 125MHz
rawData = mappedFile.Data.rawData;
rawData = rawData(1:1128,:,:);
clear mappedFile
% Create binary file
fid = fopen(fileName, 'w');
for iFrames = 1:nFramesSaved,
    % --------------------- Save a B-scan frame ----------------------------
    fwrite(fid, squeeze(rawData(:,:,iFrames)), 'uint16');
end
fclose(fid);
