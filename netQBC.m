% Function convolutional neural network
function [accuracy,YTest,scores,convnet]     = netQBC(trainDigitData,testDigitData,...
Ydef,Xdef,NumChannel,epochs,convLayer1,convLayer2,poolLayer1,poolLayer2,...
connectLayer,LearnRate)


layers = [imageInputLayer([Xdef Ydef NumChannel])% RGB = 3 
              convolution2dLayer(convLayer1,convLayer2) % 5,20
              reluLayer
              maxPooling2dLayer(poolLayer1,'Stride',poolLayer2)
              fullyConnectedLayer(connectLayer) % three classes
              softmaxLayer
              classificationLayer()];
options = trainingOptions('sgdm','MaxEpochs',epochs, ...
    'InitialLearnRate',LearnRate);
convnet = trainNetwork(trainDigitData,layers,options);
% [trainedNet,traininfo] = trainNetwork(trainDigitData,layers,options);
[YTest,scores] = classify(convnet,testDigitData);
TTest = testDigitData.Labels;
accuracy = sum(YTest == TTest)/numel(TTest);

end
