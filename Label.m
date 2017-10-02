% function label data sample
function [countTrainA,countTrainB,countTrainC,countTrainD] =...
    Label(testDigitData,QBC,countTrainA,countTrainB,countTrainC,countTrainD)

    imgAlpha = imread(testDigitData.Files{QBC});
    
    if (testDigitData.Labels(QBC)=='A') 
        s1 = 'C:\Users\Carlos\ImageSourceTrain\A\LA';
        countTrainA = countTrainA + 1;
        s2 = int2str(countTrainA);
        s3 = '.bmp';
        addressAlpha  = strcat(s1,s2,s3);
        imwrite(imgAlpha,addressAlpha);   
    end
    if (testDigitData.Labels(QBC)=='B') 
        s1 = 'C:\Users\Carlos\ImageSourceTrain\B\LB';
        countTrainB = countTrainB + 1;
        s2 = int2str(countTrainB);
        s3 = '.bmp';
        addressAlpha  = strcat(s1,s2,s3);
        imwrite(imgAlpha,addressAlpha);   
    end
    if (testDigitData.Labels(QBC)=='C') 
        s1 = 'C:\Users\Carlos\ImageSourceTrain\C\LC';
        countTrainC = countTrainC + 1;
        s2 = int2str(countTrainC);
        s3 = '.bmp';
        addressAlpha  = strcat(s1,s2,s3);
        imwrite(imgAlpha,addressAlpha);   
    end
        if (testDigitData.Labels(QBC)=='D') 
        s1 = 'C:\Users\Carlos\ImageSourceTrain\D\LD';
        countTrainD = countTrainD + 1;
        s2 = int2str(countTrainD);
        s3 = '.bmp';
        addressAlpha  = strcat(s1,s2,s3);
        imwrite(imgAlpha,addressAlpha);   
    end
end