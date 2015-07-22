function k = num_principal_component(S)

s = sum(sum(S));
k = 8;
for i  = 1:size(S,1)
    z = sum(sum(S(1:i,1:i)))/(s);
    fprintf('variance retained :%f \n',z);
    if z >= 0.99
        if i < k
            k = i;
        end
    end
end
fprintf('no. of principal components required is : %d \n',k);
end