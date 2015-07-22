function [X_norm,mu,sigma] = featureNormalize(X)
% function for normalization of feature vectors
mu = mean(X);
sigma = std(X);
X_n = bsxfun(@minus, X, mu);
X_norm = bsxfun(@rdivide, X_n, sigma);

end