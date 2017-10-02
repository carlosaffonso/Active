% Function vote LBP
function [QBC,Er] = voteLBP(threshold,testDigitData)
    [dimTest,~]  = size(testDigitData.Labels);
    LBPTest = ones(dimTest,60);
    
    for i=1:dimTest
    img      = imread(testDigitData.Files{i});
    img      = rgb2gray(img);
    LBPimg   = extractLBPFeatures(img);
    LBPTest(i,1:59) = LBPimg(1:59);
    LBPTest(i,60)= testDigitData.Labels(i);
    end
    
    inputs = LBPTest(:,1:59)';
    targets = LBPTest(:,60)';
    
    % Create a Pattern Recognition Network
    hiddenLayerSize = 24;
    net = patternnet(hiddenLayerSize);
    net.trainParam.epochs = 1000;
    % Train the Network
    [net,~] = train(net,inputs,targets);

    % Test the Network
    outputs = net(inputs);
    errors = gsubtract(targets,outputs);  
    errors = (errors.^2);
    
    % QBC
    [~,delta] = sort(errors,'descend');
%     [~,delta] = sort(errors);
    QBC = delta(threshold);
    Er = .01*sum(errors).^.5;
end