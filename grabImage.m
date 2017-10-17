% function load image data store
function [trainDigitData,testDigitData]= grabImage(trainingNumFiles)

% read image data store
digitDatasetPath = fullfile('C:\Users\Carlos\','ImageSource\');
digitData = imageDatastore(digitDatasetPath,...
'IncludeSubfolders',true,'LabelSource','foldernames','FileExtensions','.bmp');

% split data
[trainDigitData,testDigitData] = splitEachLabel(digitData, ...
trainingNumFiles,'randomize');
end