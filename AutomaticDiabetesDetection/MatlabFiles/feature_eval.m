function [index] = feature_eval(X,Y)
fprintf('======================================================\n');
fprintf('Running feature evaluation \n\n');

% separate negative and positive cases x1 as diabetic and x2 non-diabetic
index_t = find(Y==1); index_f = find(Y==0); 
x1 = X(index_t,:); x2 = X(index_f,:);

%% ==== histogram based approach ========   
fprintf('Running histogram comparison\n');
figure

% feature 1
subplot(2,2,1)
hist(x1(:,1));
hold on
hist(x2(:,1));

h = findobj('-property','FaceColor');
set(h(2),'FaceColor',[0.8 0.07 0],'EdgeColor',[0 0 0],'facealpha',0.6);
set(h(1),'EdgeColor',[1 1 1 ],'facealpha',0.7);

xlabel('Number of times pregnant ')
ylabel('Frequency');
legend('diabetic','non-diabetic')
title('Plot for feature1');
hold off

% feature 2
subplot(2,2,2)
hist(x1(:,2));
hold on
hist(x2(:,2));

h = findobj('-property','FaceColor');
set(h(2),'FaceColor',[0.8 0.07 0],'EdgeColor',[0 0 0],'facealpha',0.6);
set(h(1),'EdgeColor',[1 1 1 ],'facealpha',0.7);

xlabel('Plasma glucose concentration a 2 hours in an oral glucose tolerance test  ')
ylabel('Frequency');
legend('diabetic','non-diabetic')
title('Plot for feature2');
hold off

% feature 3
subplot(2,2,3)
hist(x1(:,3));
hold on
hist(x2(:,3));

h = findobj('-property','FaceColor');
set(h(2),'FaceColor',[0.8 0.07 0],'EdgeColor',[0 0 0],'facealpha',0.6);
set(h(1),'EdgeColor',[1 1 1 ],'facealpha',0.7);

xlabel('Diastolic blood pressure (mm Hg)')
ylabel('Frequency');
legend('diabetic','non-diabetic')
title('Plot for feature3');
hold off


% feature 4
subplot(2,2,4)
hist(x1(:,4));
hold on
hist(x2(:,4));

h = findobj('-property','FaceColor');
set(h(2),'FaceColor',[0.8 0.07 0],'EdgeColor',[0 0 0],'facealpha',0.6);
set(h(1),'EdgeColor',[1 1 1 ],'facealpha',0.7);

xlabel('Triceps skin fold thickness (mm)')
ylabel('Frequency');
legend('diabetic','non-diabetic')
title('Plot for feature4');
pause;
hold off


% feature 5
subplot(2,2,1,'replace')
hist(x1(:,5));
hold on
hist(x2(:,5));

h = findobj('-property','FaceColor');
set(h(2),'FaceColor',[0.8 0.07 0],'EdgeColor',[0 0 0],'facealpha',0.6);
set(h(1),'EdgeColor',[1 1 1 ],'facealpha',0.7);

xlabel('2-Hour serum insulin (mu U/ml) ')
ylabel('Frequency');
legend('diabetic','non-diabetic')
title('Plot for feature5');
hold off


% feature 6
subplot(2,2,2,'replace')
hist(x1(:,6));
hold on
hist(x2(:,6));

h = findobj('-property','FaceColor');
set(h(2),'FaceColor',[0.8 0.07 0],'EdgeColor',[0 0 0],'facealpha',0.6);
set(h(1),'EdgeColor',[1 1 1 ],'facealpha',0.7);

xlabel('Body mass index (weight in kg/(height in m)^2) ')
ylabel('Frequency');
legend('diabetic','non-diabetic')
title('Plot for feature6');
hold off


% feature 7
subplot(2,2,3,'replace')
hist(x1(:,7));
hold on
hist(x2(:,7));

h = findobj('-property','FaceColor');
set(h(2),'FaceColor',[0.8 0.07 0],'EdgeColor',[0 0 0],'facealpha',0.6);
set(h(1),'EdgeColor',[1 1 1 ],'facealpha',0.7);

xlabel('Diabetes pedigree function ')
ylabel('Frequency');
legend('diabetic','non-diabetic')
title('Plot for feature7');
hold off


% feature 8
subplot(2,2,4,'replace')
hist(x1(:,8));
hold on
hist(x2(:,8));

h = findobj('-property','FaceColor');
set(h(2),'FaceColor',[0.8 0.07 0],'EdgeColor',[0 0 0],'facealpha',0.6);
set(h(1),'EdgeColor',[1 1 1 ],'facealpha',0.7);

xlabel(' Age (years) ')
ylabel('Frequency');
legend('diabetic','non-diabetic')
title('Plot for feature8');
pause;
hold off

fprintf('\n');

% ================= T-test ===========================
fprintf('Running T-test:\n');
dataTrainG1 = X(grp2idx(Y)==1,:);
dataTrainG2 = X(grp2idx(Y)==2,:);
[h,p,ci,stat] = ttest2(dataTrainG1,dataTrainG2,'Vartype','unequal');
close all
bar(p);
xlabel('feature no.');
ylabel('p-value');
pause
format bank
csvwrite('p.dat',p);
[E, index] = sortrows(p');


fprintf('\n');

%% ===================== Results =====================

fprintf('statically significance using t-test :\n');
fprintf(' 1. Plasma glucose concentration a 2 hours in an oral glucose tolerance test, p-value : 2.6442e-36  \n');
fprintf(' 2. Body mass index (weight in kg/(height in m)^2), p-value : 6.5662e-17 \n');
fprintf(' 3. Age (years), p-value : 1.2015e-11 \n');
fprintf(' 4. Number of times pregnant ,p-value : 6.8219e-09  \n');
fprintf(' 5. Diabetes pedigree function ,p-value :  6.1005e-06  \n');
fprintf(' 6. 2-Hour serum insulin (mu U/ml),p-value : 0.0010469   \n');
fprintf(' 7. Triceps skin fold thickness (mm),p-value : 0.049356  \n');
fprintf(' 8. Diastolic blood pressure (mm Hg) ,p-value : 0.087354 \n');

     



end