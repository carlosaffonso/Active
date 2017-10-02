% function load new data
function [trainDigitData,testDigitData]=loadNewData(loop)
    
%   load new data train
    NewdigitDatasetPathTrain = fullfile('C:\Users\Carlos\','ImageSourceTrain\');
    trainDigitData = imageDatastore(NewdigitDatasetPathTrain,...
    'IncludeSubfolders',true,'LabelSource','foldernames','FileExtensions','.bmp');
%   load new data test

    even = mod(loop,2);
    if (even)
        NewdigitDatasetPathTest = fullfile('C:\Users\Carlos\','ImageSourceTest0\');
        testDigitData = imageDatastore(NewdigitDatasetPathTest,...
        'IncludeSubfolders',true,'LabelSource','foldernames','FileExtensions','.bmp');  
    else
        NewdigitDatasetPathTest = fullfile('C:\Users\Carlos\','ImageSourceTest1\');
        testDigitData = imageDatastore(NewdigitDatasetPathTest,...
        'IncludeSubfolders',true,'LabelSource','foldernames','FileExtensions','.bmp');         
    end
    
end