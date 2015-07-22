function [mat , accuracy,post ] = naive_bayes_predict( Z , Y, indices)
accuracy  = 0.0;

for i = 1:10
    test = (indices == i); train = ~test;
    class = NaiveBayes.fit(Z(train,:),Y(train,:));
    [post cpre] = posterior(class,Z(test,:));
    %classperf(cp,class,test)
    C2 = class.predict(Z(test,:));
    cMat2 = confusionmat(Y(test,:),C2);
    if i == 1 
        mat = cMat2;
    else
        mat = mat + cMat2;
    end
    accuracy = accuracy + trace(cMat2)./sum(sum(cMat2));
end
end