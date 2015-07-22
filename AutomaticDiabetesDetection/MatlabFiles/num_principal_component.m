function k = num_principal_component(D)

s = sum(sum(D));
k = 8;
for i  = 1:size(D,1)
    z = sum(sum(D(1:i,1:i)))/(s);
    fprintf('variance retained :%f and k is :%d \n',z,i);
    if z >= 0.88
        if i < k
            k = i;
        end
        break
    end
    
end
fprintf('no. of principal components required is : %d and variance retained is: %f %% \n',k,z*100);

end