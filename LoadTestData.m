% Function load the test data
function  LoadTestData(testDigitData,loop)
    countA=0;countB=0;countC=0;
    [dimTest,~]=size(testDigitData);
    even = mod(loop,2);
    
    if (even)
        for i=1:dimTest
            imgTest = imread(testDigitData.Files{i});
            if (testDigitData.Labels(i)=='A') 
                s1 = 'C:\Users\Carlos\ImageSourceTest1\A\ULA';
                countA = countA + 1;
                s2 = int2str(countA);
            end
            if (testDigitData.Labels(i)=='B') 
                s1 = 'C:\Users\Carlos\ImageSourceTest1\B\ULB';
                countB = countB + 1;
                s2 = int2str(countB);
            end
            if (testDigitData.Labels(i)=='C') 
                s1 = 'C:\Users\Carlos\ImageSourceTest1\C\ULC';
                countC = countC + 1;
                s2 = int2str(countC);
            end
            s3 = '.bmp';
            adressTest = strcat(s1,s2,s3);
            imwrite(imgTest,adressTest);
        end
    else
        for i=1:dimTest
            imgTest = imread(testDigitData.Files{i});
            if (testDigitData.Labels(i)=='A') 
                s1 = 'C:\Users\Carlos\ImageSourceTest0\A\ULA';
                countA = countA + 1;
                s2 = int2str(countA);
            end
            if (testDigitData.Labels(i)=='B') 
                s1 = 'C:\Users\Carlos\ImageSourceTest0\B\ULB';
                countB = countB + 1;
                s2 = int2str(countB);
            end
            if (testDigitData.Labels(i)=='C') 
                s1 = 'C:\Users\Carlos\ImageSourceTest0\C\ULC';
                countC = countC + 1;
                s2 = int2str(countC);
            end
            s3 = '.bmp';
            adressTest = strcat(s1,s2,s3);
            imwrite(imgTest,adressTest);
        end
    end
end
 

