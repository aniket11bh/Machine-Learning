function p = fitnav(X , Y)

[m n] = size(X);
mu  = zeros(1,size(X,2));
sigma2 = zeros(1,size(X,2));
%cov = zeros(size(X,2));

mu = sum(X,1)/m
for i = 1:m
    sigma2 = sigma2 + (X(i,:)-mu).^2;
end
sigma2 = (1/m)*sigma2;

k = length(mu);

if (size(sigma2, 2) == 1) || (size(sigma2, 1) == 1)
    sigma2 = diag(sigma2);
end

X = bsxfun(@minus, X, mu(:)');
p = (2 * pi) ^ (- k / 2) * det(sigma2) ^ (-0.5) * ...
    exp(-0.5 * sum(bsxfun(@times, X * pinv(sigma2), X), 2));

end