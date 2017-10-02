% Program  Active learning scheme to speed up learn phase  
% Author: Carlos Affonso / Olli Silven / Riku 
% Oulu University 7/sep/17


% Dataset                          Active learning criteria 
% Sguario                = 1       Random selection  = 1 
% Balanced               = 2       QBC               = 2
% A_BC                   = 3       play it safe      = 3 
% Faber original         = 4       LBP               = 4
% Faber revised          = 5
% Retraining Faber       = 6
% Tree species           = 7

% Set up 
dataset                  = 1  ; NetAct           = 4 ;
trainingNumFiles         = 3  ; threshold        = 3 ; 
Alpha                    = 50 ; round            = 1 ;
epochs                   = 100; 

%CNN topology
NumChannel               = 3  ; %RGB image   
convLayer1               = 5  ; convLayer2       = 2 ;   
poolLayer1               = 2  ; poolLayer2       = 2 ;   
LearnRate           = 0.0001  ; 

% inicializing
ContRes   = 0                 ; loop             = 0 ; 
Acc       = zeros(Alpha,round); accuracy         = 0 ;
sizeTest  = zeros(Alpha,1)    ;
LabSamples= zeros(Alpha,round);

while(ContRes<round)
    %  counters
    ContRes = ContRes + 1;
    loop    = 0;
    
    %  select training and test dataset
    DelFile;
    [trainDigitData,testDigitData,fulldata,fullA,fullB,fullC,fullD,...
        Ydef,Xdef,numClass] = selectDataset(dataset,trainingNumFiles);
    connectLayer     = numClass ; % number of sensitive neurons

    % setup data 
    countTrainA  = trainingNumFiles; countTrainC  = trainingNumFiles;  
    countTrainB  = trainingNumFiles; countTrainD  = trainingNumFiles;
    
    % loop active learning
    while(loop<=Alpha)
        loop=loop+1;   

    %   load train data
        LoadTrainingData(trainingNumFiles,numClass,trainDigitData);

    %   load test data
        LoadTestData(testDigitData,loop);

    %   Select QBC criteria 
        switch(NetAct)
            case 1
                QBC = ceil(rand*(fulldata-numClass*trainingNumFiles-loop));               
            case 2               
                %   run convolutional neural network #1 
                [accuracy,YTest,scores,convnet] = netQBC(trainDigitData,testDigitData,...
                Ydef,Xdef,NumChannel,epochs,convLayer1,convLayer2,poolLayer1,...
                poolLayer2,connectLayer,LearnRate);
                %   vote    
                QBC    = voteSmooth(scores,threshold,numClass);                              
            case 3
               %    run convolutional neural network #1 
               [accuracy,YTest,scores,convnet] = netQBC(trainDigitData,testDigitData,...
               Ydef,Xdef,NumChannel,epochs,convLayer1,convLayer2,poolLayer1,...
               poolLayer2,connectLayer,LearnRate);
               [threshold,~] = size(testDigitData.Labels);
               %   vote                
               QBC    = voteSmooth(scores,threshold,numClass);             
            case 4
               [QBC,Er] = voteLBP(threshold,testDigitData); 
               accuracy = Er;
        end
        Acc(loop,ContRes)=accuracy;

    %   query oracle
        LabSamples(loop)=QBC;
        [countTrainA,countTrainB,countTrainC,countTrainD] =...
        Label(testDigitData,QBC,countTrainA,countTrainB,countTrainC,countTrainD);

    %   build new test dataset
        delTestFile(loop);
        buildTest(testDigitData,QBC,loop);

    %   load new data
        [trainDigitData,testDigitData]=loadNewData(loop);
        disp(accuracy);disp(loop);
    end
    % show results
    % showResults(Acc,trainDigitData);
    % plot(Acc);
end

% save('convnet.mat','convnet');

 


