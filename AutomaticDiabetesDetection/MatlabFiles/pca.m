function [V ,D] = pca(X,Y)

% Sigma = cov(X) is the correlation matrix if X is done mean
% normalizations.. Another way to obtain correlation matrix is by
% corrcov(C).. 
%V is eigenvector and D is eigenvalues

% C is correlation matrix
C = (1./size(X,1))*X'*X ;
[V D]= eig(C);

end