function outputCell = readCSVfile(varargin)
% Reads acqParam.CSV file with mixed data type (text + numbers) generateed by
% LabView
% SYNTAX:
% outputCell = readCSVfile(fileName)
% INPUTS:
% fileName      Name of the .CSV file (usually acqParam.csv)
% OUTPUTS:
% outputCell    Variable with file contents
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/09/19

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
        ssOCTdefaults.dirExp);
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
end

% Check if file exists (When fopen successfully opens a file, it returns a file
% identifier greater than or equal to 3)
if (fid >= 3)
    tline = ' ';
    % Column delimiter (comma) '\,'
    delimiter = '\,';
    iLines = 1;
    
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
    
    % Check number of lines read
    switch size(outputCell,1)
        case 10
            % third version with 10 fields
            ssOCTdefaults.nLinesPerFrame            = outputCell{1,2};
            ssOCTdefaults.nFrames                   = outputCell{2,2};
            ssOCTdefaults.galvos.xStartVolt         = outputCell{3,2};
            ssOCTdefaults.galvos.xEndVolt           = outputCell{4,2};
            ssOCTdefaults.galvos.yStartVolt         = outputCell{5,2};
            ssOCTdefaults.galvos.yEndVolt           = outputCell{6,2};
            ssOCTdefaults.dirCurrExp                = outputCell{7,2};
            ssOCTdefaults.subjectID                 = outputCell{8,2};
            ssOCTdefaults.expDescription            = outputCell{9,2};
            ssOCTdefaults.galvos.nSamplesPerVolume  = outputCell{10,2};
            ssOCTdefaults.pauseTime                 = 1.1 * ...
                ssOCTdefaults.galvos.nSamplesPerVolume / 50e3;
            
        case 9
            % second version with 9 fields
            ssOCTdefaults.nLinesPerFrame    = outputCell{1,2};
            ssOCTdefaults.nFrames           = outputCell{2,2};
            ssOCTdefaults.galvos.xStartVolt = outputCell{3,2};
            ssOCTdefaults.galvos.xEndVolt   = outputCell{4,2};
            ssOCTdefaults.galvos.yStartVolt = outputCell{5,2};
            ssOCTdefaults.galvos.yEndVolt   = outputCell{6,2};
            ssOCTdefaults.dirCurrExp        = outputCell{7,2};
            ssOCTdefaults.subjectID         = outputCell{8,2};
            ssOCTdefaults.expDescription    = outputCell{9,2};
        otherwise
            % Default case (first version with 7 fields)
            ssOCTdefaults.nLinesPerFrame    = outputCell{1,2};
            ssOCTdefaults.nFrames           = outputCell{2,2};
            ssOCTdefaults.galvos.xStartVolt = outputCell{3,2};
            ssOCTdefaults.galvos.xEndVolt   = outputCell{4,2};
            ssOCTdefaults.galvos.yStartVolt = outputCell{5,2};
            ssOCTdefaults.galvos.yEndVolt   = outputCell{6,2};
            ssOCTdefaults.dirCurrExp        = outputCell{7,2};
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
