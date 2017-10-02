% function build new test dataset
function buildTest(testDigitData,QBC,loop)
    countA = 0;countB =0;countC = 0;countD = 0;s3 = '.bmp';
    dimTest = size(testDigitData.Labels);
    for i=1:dimTest
        img = imread(testDigitData.Files{i});
        if(testDigitData.Labels(i)=='A')
            countA = countA + 1;
            s2 = int2str(countA);
            if (i~=QBC)
                s0 = 'C:\Users\Carlos\ImageSourceTest0\A\ULA';
                s1 = 'C:\Users\Carlos\ImageSourceTest1\A\ULA';
                adress0 = strcat(s0,s2,s3);
                adress1 = strcat(s1,s2,s3);
                imwrite(img,adress0); 
                imwrite(img,adress1);         
            else
                s = 'C:\Users\Carlos\ImageSourceAlpha\QBCA';
                s2 = int2str(loop);
                loop = loop +1;
                adress = strcat(s,s2,s3);
                imwrite(img,adress); 
            end
        
        end
        
        if(testDigitData.Labels(i)=='B')
            countB = countB + 1;
            s2 = int2str(countB);
            if (i~=QBC)
                s0 = 'C:\Users\Carlos\ImageSourceTest0\B\ULB';
                s1 = 'C:\Users\Carlos\ImageSourceTest1\B\ULB';
                adress0 = strcat(s0,s2,s3);
                adress1 = strcat(s1,s2,s3);
                imwrite(img,adress0); 
                imwrite(img,adress1);   
            else
                s = 'C:\Users\Carlos\ImageSourceAlpha\QBCB';
                s2 = int2str(loop);
                loop = loop +1;
                adress = strcat(s,s2,s3);
                imwrite(img,adress);
            end
        end
        
        if(testDigitData.Labels(i)=='C')
            countC = countC + 1;
            s2 = int2str(countC);
            
            if (i~=QBC)
                s0 = 'C:\Users\Carlos\ImageSourceTest0\C\ULC';
                s1 = 'C:\Users\Carlos\ImageSourceTest1\C\ULC';
                adress0 = strcat(s0,s2,s3);
                adress1 = strcat(s1,s2,s3);
                imwrite(img,adress0); 
                imwrite(img,adress1);   
            else
                s = 'C:\Users\Carlos\ImageSourceAlpha\QBCC';
                s2 = int2str(loop);
                loop = loop +1;
                adress = strcat(s,s2,s3);
                imwrite(img,adress); 
            end
        end
            
        if(testDigitData.Labels(i)=='D')
            countD = countD + 1;
            s2 = int2str(countD);
            if (i~=QBC)
                s0 = 'C:\Users\Carlos\ImageSourceTest0\D\ULD';
                s1 = 'C:\Users\Carlos\ImageSourceTest1\D\ULD';
                adress0 = strcat(s0,s2,s3);
                adress1 = strcat(s1,s2,s3);
                imwrite(img,adress0); 
                imwrite(img,adress1);   
            else
                s = 'C:\Users\Carlos\ImageSourceAlpha\QBCD';
                s2 = int2str(loop);
                loop = loop +1;
                adress = strcat(s,s2,s3);
                imwrite(img,adress); 
            end

        end        
       
    end
 
end