function [Z, Y] = pca_selection(X,Y)

fprintf('Running pca on example dataset\n');

% doing mean normalization before applying pca.. C is correlation matrix
[X,mu, sigma] = featureNormalize(X);
C = (1./size(X,1))*(X')*X ;

% storing the correlation matrix
format bank
csvwrite('corrcovC.dat',C);

% getting the eigenvectors in V and eigenvalues in D and selecting no. of
% principal components
[V D]= eig(C);
K = num_principal_component(D);    

explained = D*ones(8,1);
bar(explained,'k');
xlabel('principal component');
ylabel('variance explained');
figure()
pareto(explained);
xlabel('Principal Component');
ylabel('Variance Explained (%)');

U_reduce = V(:,1:K); % u_reduced is a n x k matrix
Z = X*U_reduce;

format bank
csvwrite('covZ.dat',corr(Z));

plotData(Z, Y);
end