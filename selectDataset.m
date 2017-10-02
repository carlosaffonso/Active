% function select dataset
function  [trainDigitData,testDigitData,fulldata,fullA,fullB,fullC,fullD,...
    Ydef,Xdef,numClass] = selectDataset(dataset,trainingNumFiles)

    switch(dataset)
        case 1
            fulldata         = 374 ;fullA = 144;fullB=177;fullC = 53;fullD = 0;
            Ydef             = 94  ; 
            Xdef             = 27  ; 
            numClass         = 3   ;
            [trainDigitData,testDigitData]= grabImage(trainingNumFiles);
        case 2
            fulldata         = 159 ;fullA = 53;fullB=53;fullC = 53;fullD = 0;
            Ydef             = 94  ; 
            Xdef             = 27  ; 
            numClass         = 3   ;
            [trainDigitData,testDigitData]= grabImageBal(trainingNumFiles);
        case 3
            fulldata         = 374 ;fullA = 144;fullB=177+53;fullC = 0;fullD = 0;
            Ydef             = 94  ; 
            Xdef             = 27  ; 
            numClass         = 2   ;
            [trainDigitData,testDigitData]= grabImageA_BC(trainingNumFiles);

        case 4
            fulldata     = 242+248 ;fullA = 242;fullB=248  ;fullC =0;fullD = 0;
            Ydef             = 45  ; 
            Xdef             = 100 ; 
            numClass         = 2   ;
            [trainDigitData,testDigitData]= grabImageFC(trainingNumFiles);
            
         case 5
            fulldata     = 190+188 ;fullA = 190;fullB=188;fullC =0;fullD = 0;
            Ydef             = 45  ; 
            Xdef             = 100 ; 
            numClass         = 2   ;
            [trainDigitData,testDigitData]= grabImageFC1(trainingNumFiles);
            
        case 6
            fulldata       = 52+55 ;fullA = 52 ;fullB = 55;fullC =0;fullD = 0;
            Ydef             = 45  ; 
            Xdef             = 100 ; 
            numClass         = 2   ;
            [trainDigitData,testDigitData]= grabImageReTrain(trainingNumFiles);
            
        case 7                             
            fulldata       = 122 ;fullA = 30 ;fullB = 30;fullC =30; fullD = 32;
            Ydef             = 160 ; 
            Xdef             = 120 ; 
            numClass         = 4   ;
            [trainDigitData,testDigitData]= grabImageTree(trainingNumFiles);
            
    end

end