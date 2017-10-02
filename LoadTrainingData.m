% Function load the trainig data    
function LoadTrainingData(trainingNumFiles,numClass,trainDigitData)
    countA=0;countB=0;countC=0;countD = 0;
    
    for i=1:numClass*trainingNumFiles

        imgTrain = imread(trainDigitData.Files{i});
        if (trainDigitData.Labels(i)=='A') 
            s1 = 'C:\Users\Carlos\ImageSourceTrain\A\LA';
            countA = countA + 1;
            s2 = int2str(countA);
        end
        if (trainDigitData.Labels(i)=='B') 
            s1 = 'C:\Users\Carlos\ImageSourceTrain\B\LB';
            countB = countB + 1;
            s2 = int2str(countB);
        end
        if (trainDigitData.Labels(i)=='C') 
            s1 = 'C:\Users\Carlos\ImageSourceTrain\C\LC';
            countC = countC + 1;
            s2 = int2str(countC);
        end
        if (trainDigitData.Labels(i)=='D') 
            s1 = 'C:\Users\Carlos\ImageSourceTrain\D\LD';
            countD = countD + 1;
            s2 = int2str(countD);
        end
        s3 = '.bmp';
        adressTrain = strcat(s1,s2,s3);
        imwrite(imgTrain,adressTrain);

    end
end