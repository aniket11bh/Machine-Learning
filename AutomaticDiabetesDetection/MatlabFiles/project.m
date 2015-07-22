%% Initialization
clear ; close all; clc
%% ===============Part1 : Loading and visualizing data==========
% This data contains 
%1. Number of times pregnant 
%2. Plasma glucose concentration a 2 hours in an oral glucose tolerance test 
%3. Diastolic blood pressure (mm Hg) 
%4. Triceps skin fold thickness (mm) 
%5. 2-Hour serum insulin (mu U/ml) 
%6. Body mass index (weight in kg/(height in m)^2) 
%7. Diabetes pedigree function 
%8. Age (years) 
%9. Class variable (0 or 1) 

fprintf('Loading and visualizing data..\n'); 
M = load('pima-indians-diabetes.data.txt');
% whos gives the size of the matrix stored in bytes
whos 
X = M(:,1:8); 
Y = M(:,end);

% Data parameters :
[m n] = size(X);

%% ==================Feature Evaluation =========================

%get the index of statically significant features
index = feature_eval(X,Y);


%% ==================Feature selection ==========================
fprintf('======================================================\n');
fprintf('Running feature selection AND compression :\n\n');

%changing the feature vector as 1 to be most statically significant
X = X(:,index);
% In feature ranking X should be n x m, and Y 1 x m
weight  = sum(sum(corr(X))) - sum(diag(corr(X)));
[IDX , z] = rankfeatures(X',Y','NumberOfIndices',8,'CCWeighting',weight/56.0);
X = X(:,IDX);


% PCA.. but first features have to be arranged.. Any classifcation to be
% applied on x,y not X,Y
 [x ,y] = pca_selection(X,Y);

%% ================== USING Bayesian classifcation ==============
fprintf('======================================================\n');
fprintf('Running Naive Bayes classification :\n\n');

% prior probability of classes
prior_n = 500./768;
priot_d = 1 - prior_n ;

% likelihood probabilities
%pd = fitdist(x,'Kernel');

% Applying k-fold cross validation
indices = crossvalind('Kfold',m,10);
accuracy  = 0.0; 
[mat, accuracy, post] = naive_bayes_predict(x ,y ,indices);
 sens = mat(1,1)./(mat(1,1) + mat(2,1));
 spec = mat(2,2)./(mat(2,2) + mat(1,2));
 i = 10.0 ;       
fprintf('percentage accuracy is : %f %%\n',(accuracy./i)*100);
fprintf('sensitivity of classifier is : %f\n',sens);
fprintf('specificity of classifier is : %f\n',spec);

%% ================= USING SVM ==================================
fprintf('======================================================\n');
fprintf('Running Support vector machines classification :\n\n');
project_svm(M);




