%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\ccm21008\GitHub\gbl_matlab_tools\LIS\44040h2023.txt
%
% To extend the code to different selected data or a different text file, generate a function instead of a script.

% Auto-generated by MATLAB on 2024/05/08 12:47:33

%% Initialize variables.
filename = 'C:\Users\ccm21008\GitHub\gbl_matlab_tools\LIS\44022h2023.txt';
startRow = 3;

%% Format for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: double (%f)
%	column18: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%4f%3f%3f%3f%3f%4f%5f%5f%6f%6f%6f%4f%7f%6f%6f%6f%5f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this code. If an error occurs for a different file, try regenerating the code from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post processing code is included. To generate code which works for unimportable data, select unimportable cells in a file and regenerate the script.

%% Create output variable
NDBC_44022h2023 = table(dataArray{1:end-1}, 'VariableNames', {'YY','MM','DD','hh','mm','WDIR','WSPD','GST','WVHT','DPD','APD','MWD','PRES','ATMP','WTMP','DEWP','VIS','TIDE'});

%% Clear temporary variables
clearvars filename startRow formatSpec fileID dataArray ans;

%% Save data
save NDBC_44022h2023.mat NDBC_44022h2023;
