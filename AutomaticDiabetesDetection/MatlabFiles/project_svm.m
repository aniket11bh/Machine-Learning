function project_svm(M)

fprintf('SVM classification of the diabetes set\n');
X = M(:,1:8);
Y = M(:,end);
   
% Data parameters
m = size(X, 1);
n = size(X, 2);
   
% map y =0 to y = -1
Y(Y==0) = -1;

indices = crossvalind('Kfold',m,10);
accuracy  = 0.0;
for i = 1:10
    test = (indices == i); train = ~test;
    model = svmtrain(X(train,1:2),Y(train),'Kernel_Function','rbf');
    group = svmclassify(model,X(test,1:2));
    cMat2 = confusionmat(Y(test),group);
    if i == 1 
        mat = cMat2;
    else
        mat = mat + cMat2;
    end
    accuracy = accuracy + trace(cMat2)./sum(sum(cMat2));
end

fprintf('percentage accuracy of svm is : %f %%\n',(accuracy./i)*100);
sens = mat(1,1)./(mat(1,1) + mat(2,1));
spec = mat(2,2)./(mat(2,2) + mat(1,2));
fprintf('sensitivity of classifier is : %f\n',sens);
fprintf('specificity of classifier is : %f\n',spec);
end