% Reads .CSV file from Altera SignalTap
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/05/30
filename = 'TEST.csv';
pathname = 'D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\Interpolation\';
% Buffer size for textscan function
BUFFER_SIZE = 2^16;
% Number of rows that contain headers
nHeaders = 25;
% Total number of columns in signaltap generated file
nCols = 324;
textFormat = '%d ';
textFormat = repmat(textFormat,[1 nCols]);
% Read 17th and 32nd columns as a string of binary numbers
textFormat(3*2-1) = 's';
textFormat(3*17-1) = 's';
textFormat(3*32-1) = 's';
% textFormat(3*33-1) = 's';
[filename, pathname] = uigetfile({'*.csv', 'Comma Separated Value (*.csv)'},...
    'Pick a .CSV file',fullfile(pathname,filename));
if isequal(filename,0) || isequal(pathname,0)
    disp('User pressed cancel')
    return
else
    C = importdata(fullfile(pathname,filename), ',', nHeaders);
end

% Clear unneeded data
C.data = [];

% Read .csv file as a text file
fid = fopen(fullfile(pathname,filename));
myData = textscan(fid, '%s', 'Delimiter', '\n', 'BufSize', BUFFER_SIZE);
fclose(fid);

% Remove header lines
myData = myData{1,1}(nHeaders+1:end);

% Preallocating memory
myData1 = cell(size(myData,1),nCols);

% Filling up cells
for iLines=1:size(myData,1),
    myData1(iLines,:) = textscan(myData{iLines}, textFormat, 'Delimiter', ',' ,...
        'BufSize', BUFFER_SIZE);
    % Convert 2nd column to decimal number
    myData1{iLines,17} = int32(base2dec(myData1{iLines,2},2));
    % Convert 17th column to decimal number
    myData1{iLines,17} = int32(base2dec(myData1{iLines,17},2));
    % Convert 32nd column to decimal number
    myData1{iLines,32} = int32(base2dec(myData1{iLines,32},2));
end

% Convert cell to matrix
myData = cell2mat(myData1);

% Add a row of zeros
myData = [zeros(1,size(myData,2)); myData];

% Clean up
clear myData1;

t = myData(:,1); % time in ns
trigger50 = myData(:,32); % 50 kHz trigger
address = myData(:,33); % RAM address
ADC = myData(:,17); % ADC data

% Clean up
% clear myData;

% ==============================================================================
% [EOF]
