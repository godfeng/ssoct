% Reads .CSV file from Altera SignalTap
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/05/30
filename = 'counterMonitor.csv';
pathname = 'D:\Edgar\Documents\OCT\';
nHeaders = 9;
nCols = 57;
textFormat = '%d ';
textFormat = repmat(textFormat,[1 nCols]);
% Read 3rd and 18th columns as a string of binary numbers
textFormat(3*3-1) = 's';
textFormat(3*18-1) = 's';
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
myData = textscan(fid, '%s', 'Delimiter', '\n');
fclose(fid);

% Remove header lines
myData = myData{1,1}(nHeaders+1:end);

% Preallocating memory
myData1 = cell(size(myData,1),nCols);

% Filling up cells
for iLines=1:size(myData,1),
    myData1(iLines,:) = textscan(myData{iLines}, textFormat, 'Delimiter', ',');
    % Convert 3rd column to decimal number
    myData1{iLines,3} = int32(base2dec(myData1{iLines,3},2));
    % Convert 18th column to decimal number
    myData1{iLines,18} = int32(base2dec(myData1{iLines,18},2));
end

% Convert cell to matrix
myData = cell2mat(myData1);

% Clean up
clear myData1;






