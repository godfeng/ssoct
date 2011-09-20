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
% Read line from file, discard newline character
tline = fgetl(fid);

% Split header
outputCell(1,:) = regexp(tline, '\,', 'split');

% Parse and read rest of file
ctr = 1;
while(~feof(fid))
    if ischar(tline)
        ctr = ctr + 1;
        tline = fgetl(fid);
        outputCell(ctr,:) = regexp(tline, '\,', 'split');
    else
        break;
    end
end
fclose(fid);
% ==============================================================================
% [EOF]
