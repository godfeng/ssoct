function outputCell = readCSVfile(fileName)
% Reads .CSV file with mixed data type (text + numbers) generateed by LabView
% SYNTAX:
% outputCell = readCSVfile(fileName)
% INPUTS:
% fileName      Name of the .CSV file
% OUTPUTS:
% outputCell    Variable with file contents
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/09/19

% Open file
fid = fopen(fileName, 'r');

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
    
    % Parse parameters to global variable
    global SSOctDefaults
    SSOctDefaults.nLinesPerFrame    = outputCell{1,2};
    SSOctDefaults.nFrames           = outputCell{2,2};
    SSOctDefaults.galvos.xStartVolt = outputCell{3,2};
    SSOctDefaults.galvos.xEndVolt   = outputCell{4,2};
    SSOctDefaults.galvos.yStartVolt = outputCell{5,2};
    SSOctDefaults.galvos.yEndVolt   = outputCell{6,2};
    SSOctDefaults.dirCurrExp        = outputCell{7,2};
    SSOctDefaults.subjectID         = outputCell{8,2};
    SSOctDefaults.expDescription    = outputCell{9,2};
else
    % Return an empty cell if file does not exist
    outputCell = {};
    % Close all open files
    fclose('all');
    disp(['File ' fileName ' does not exist'])
end
% ==============================================================================
% [EOF]
