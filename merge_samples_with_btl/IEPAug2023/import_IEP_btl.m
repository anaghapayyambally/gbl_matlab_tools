%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\ccm21008\Documents\GitHub\gbl_matlab_tools\merge_samples_with_btl\IEPAug2023\Alg293_August 2023 IEP Bottle data Mo.xlsx
%    Worksheet: Alg293 August IEP Bottle data
%
% Auto-generated by MATLAB on 06-Feb-2024 21:19:03

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 20);

% Specify sheet and range
opts.Sheet = "Alg293 August IEP Bottle data";
opts.DataRange = "A2:T381";

% Specify column names and types
opts.VariableNames = ["Filename", "Cruise", "Station", "Grid", "Type", "mmddyyyyy", "hhmm", "LatS", "LonE", "BotDepthm", "Bottle", "Pressuredb", "Depthm", "TemperatureITS90DegC", "ConductivitySm", "SalinityPSU", "Oxygenmll", "Fluorescencemgm", "SPAR", "PAR"];
opts.VariableTypes = ["categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify variable properties
opts = setvaropts(opts, ["Filename", "Cruise", "Station", "Grid", "Type", "mmddyyyyy", "hhmm"], "EmptyFieldRule", "auto");

% Import the data
IEP_btl = readtable("C:\Users\ccm21008\Documents\GitHub\gbl_matlab_tools\merge_samples_with_btl\IEPAug2023\Alg293_August 2023 IEP Bottle data Mo.xlsx", opts, "UseExcel", false);


%% Clear temporary variables
clear opts

save IEP_btl.mat IEP_btl;