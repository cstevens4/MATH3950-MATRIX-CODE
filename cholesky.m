function cholesky(n,A)

l = zeros(n);

l(1,1) = sqrt(A(1,1));

for j=2:n
    l(j,1) = A(j,1)/l(1,1);
end

for i=2:n-1
    l(i,i) = sqrt(A(i,i) - sum(l(i,1:i-1).*l(i,1:i-1)));
    for j=i+1:n
        l(j,i) = (A(j,i) - sum(l(j,1:i-1).*l(i,1:i-1)))/l(i,i);
    end 
end

l(n,n) = sqrt(A(n,n) - sum(l(n,1:n-1).*l(n,1:n-1)));

l

l'
end