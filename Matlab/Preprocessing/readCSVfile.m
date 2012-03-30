function [outputCell, timeRel] = readCSVfile(varargin)
% Reads acqParam.CSV file with mixed data type (text + numbers) generated by
% LabView
% SYNTAX:
% outputCell = readCSVfile(fileName)
% INPUTS:
% fileName      Name of the .CSV file (usually acqParam.csv)
% OUTPUTS:
% outputCell    Variable with file contents
% timeRel       Vector with relative time in seconds
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Mol�culaire
%                    �cole Polytechnique de Montr�al
% Edgar Guevara
% 2011/09/19

% Load default parameters
ss_oct_get_defaults

% Parse parameters to global variable
global ssOCTdefaults

% only want 2 optional inputs at most
numVarArgs = length(varargin);
if numVarArgs > 1
    error('readCSVfile:TooManyInputs', ...
        'requires at most 1 optional input');
end

% set defaults for optional inputs {''}
optArgs = {''};

% now put these defaults into the optArgs cell array, 
% and overwrite the ones specified in varargin.
optArgs(1:numVarArgs) = varargin;
% or ...
% [optargs{1:numvarargs}] = varargin{:};

% Place optional args in memorable variable names
[fileName] = optArgs{:};

if isempty(fileName)
    [fileName, pathName] = uigetfile('*.csv',...
        'Pick a .CSV file',...
        ssOCTdefaults.folders.dirExp);
    if isequal(fileName,0) || isequal(pathName,0)
        % Return an empty matrix
        outputCell = {};
        disp('User pressed cancel')
        return
    end
    % Open file
    fid = fopen(fullfile(pathName,fileName), 'r');
else
    % Open file
    fid = fopen(fileName, 'r');
    [pathName, fileName, fileExt] = fileparts(fileName);
    fileName = [fileName fileExt];
end

% Check if file exists (When fopen successfully opens a file, it returns a file
% identifier greater than or equal to 3)
if (fid >= 3)
    
    % Line count loop
    nLines = 0;
    chunkSize = 2^20; % read chuncks of 1MB at a time
    while ~feof(fid)
        charRead = fread(fid, chunkSize, '*uchar');
        if isempty(fid)
            break
        end
        nLines = nLines + sum(charRead == sprintf('\n'));
    end
    % Close .CSV file
    fclose(fid);                        
    
    % Pre-allocate cell
    outputCell = cell(nLines,2);
    
    tline = ' ';
    % Column delimiter (comma) '\,'
    delimiter = '\,';
    iLines = 1;
    
    % Re-open .CSV file
    fid = fopen(fullfile(pathName,fileName), 'r');
    
    % Parse, read and convert to double the file
    while(~feof(fid))
        if ischar(tline)
            % Read line from file, discard newline character
            tline = fgetl(fid);
            tempCell = regexp(tline, delimiter, 'split');
            % String to double conversion
            outputCell(iLines,:) = num2cell(str2double(tempCell));
            for iCell = 1:length(tempCell),
                if isnan(outputCell{iLines,iCell})
                    outputCell{iLines,iCell} = tempCell{1,iCell};
                end
            end
            iLines = iLines + 1;
        else
            break;
        end
    end
    % Close .csv file
    fclose(fid);
    
    % Only for the acquisition parameters .CSV file
    if strcmp(fileName,'acqParam.csv')
        % Check number of lines read
        switch size(outputCell,1)
            case 15
                % fifth version with 15 fields
                ssOCTdefaults.nLinesPerFrame            = outputCell{1,2};
                ssOCTdefaults.nFramesPerVol             = outputCell{2,2};
                ssOCTdefaults.galvos.xStartVolt         = outputCell{3,2};
                ssOCTdefaults.galvos.xEndVolt           = outputCell{4,2};
                ssOCTdefaults.galvos.yStartVolt         = outputCell{5,2};
                ssOCTdefaults.galvos.yEndVolt           = outputCell{6,2};
                ssOCTdefaults.folders.dirCurrExp        = outputCell{7,2};
                ssOCTdefaults.folders.subjectID         = outputCell{8,2};
                ssOCTdefaults.folders.expID             = outputCell{9,2};
                ssOCTdefaults.galvos.nSamplesPerVolume  = outputCell{10,2};
                ssOCTdefaults.pauseTime                 = 1.1 * ...
                    ssOCTdefaults.galvos.nSamplesPerVolume / 50e3;
                ssOCTdefaults.expNotes                  = outputCell{11,2};
                ssOCTdefaults.galvos.xFOVmm             = outputCell{12,2};
                ssOCTdefaults.galvos.xFOVmm             = outputCell{13,2};
                ssOCTdefaults.galvos.scanType.num       = outputCell{14,2};
                ssOCTdefaults.galvos.scanType.description = outputCell{15,2};
            case 11
                % fourth version with 11 fields
                ssOCTdefaults.nLinesPerFrame            = outputCell{1,2};
                ssOCTdefaults.nFramesPerVol             = outputCell{2,2};
                ssOCTdefaults.galvos.xStartVolt         = outputCell{3,2};
                ssOCTdefaults.galvos.xEndVolt           = outputCell{4,2};
                ssOCTdefaults.galvos.yStartVolt         = outputCell{5,2};
                ssOCTdefaults.galvos.yEndVolt           = outputCell{6,2};
                ssOCTdefaults.folders.dirCurrExp        = outputCell{7,2};
                ssOCTdefaults.folders.subjectID         = outputCell{8,2};
                ssOCTdefaults.folders.expID             = outputCell{9,2};
                ssOCTdefaults.galvos.nSamplesPerVolume  = outputCell{10,2};
                ssOCTdefaults.pauseTime                 = 1.1 * ...
                    ssOCTdefaults.galvos.nSamplesPerVolume / 50e3;
                ssOCTdefaults.expNotes                  = outputCell{11,2};
            case 10
                % third version with 10 fields
                ssOCTdefaults.nLinesPerFrame            = outputCell{1,2};
                ssOCTdefaults.nFramesPerVol             = outputCell{2,2};
                ssOCTdefaults.galvos.xStartVolt         = outputCell{3,2};
                ssOCTdefaults.galvos.xEndVolt           = outputCell{4,2};
                ssOCTdefaults.galvos.yStartVolt         = outputCell{5,2};
                ssOCTdefaults.galvos.yEndVolt           = outputCell{6,2};
                ssOCTdefaults.folders.dirCurrExp        = outputCell{7,2};
                ssOCTdefaults.folders.subjectID         = outputCell{8,2};
                ssOCTdefaults.folders.expID             = outputCell{9,2};
                ssOCTdefaults.galvos.nSamplesPerVolume  = outputCell{10,2};
                ssOCTdefaults.pauseTime                 = 1.3 * ...
                    ssOCTdefaults.galvos.nSamplesPerVolume / 50e3;
            case 9
                % second version with 9 fields
                ssOCTdefaults.nLinesPerFrame            = outputCell{1,2};
                ssOCTdefaults.nFramesPerVol             = outputCell{2,2};
                ssOCTdefaults.galvos.xStartVolt         = outputCell{3,2};
                ssOCTdefaults.galvos.xEndVolt           = outputCell{4,2};
                ssOCTdefaults.galvos.yStartVolt         = outputCell{5,2};
                ssOCTdefaults.galvos.yEndVolt           = outputCell{6,2};
                ssOCTdefaults.folders.dirCurrExp        = outputCell{7,2};
                ssOCTdefaults.folders.subjectID         = outputCell{8,2};
                ssOCTdefaults.folders.expID             = outputCell{9,2};
            otherwise
                % Default case (first version with 7 fields)
                ssOCTdefaults.nLinesPerFrame            = outputCell{1,2};
                ssOCTdefaults.nFramesPerVol             = outputCell{2,2};
                ssOCTdefaults.galvos.xStartVolt         = outputCell{3,2};
                ssOCTdefaults.galvos.xEndVolt           = outputCell{4,2};
                ssOCTdefaults.galvos.yStartVolt         = outputCell{5,2};
                ssOCTdefaults.galvos.yEndVolt           = outputCell{6,2};
                ssOCTdefaults.folders.dirCurrExp        = outputCell{7,2};
        end
    else
        % Create a string from cell to avoid the use of a for loop
        timeString = cell2mat(outputCell(:,2));
        % Convert string to date/time vector
        timeAbs = datevec(timeString);
        % Get date/time of first frame
        time0 = timeAbs(1,:);
        % Create a relative time vector (in seconds)
        timeRel = etime(timeAbs,time0(ones(size(timeAbs,1),1),:));
        % Create a dummy vector to 'stem' the B-frame ocurrences
        BscanOcurr = ones(size(timeRel));
    end
else
    % Return an empty cell if file does not exist
    outputCell = {};
    % Close all open files
    fclose('all');
    disp(['File ' fileName ' does not exist'])
end
% ==============================================================================
% [EOF]
