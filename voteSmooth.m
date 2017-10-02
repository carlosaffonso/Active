% Function vote active
function QBC = voteSmooth(scores,threshold,numClass) 

    [dimTest,~]=size(scores);pred =zeros(dimTest);

    for i=1:dimTest
        pred(i) = max(scores(i,1:numClass));
    end
    [~,delta  ] = sort(pred);
    QBC = delta(threshold);
        
end