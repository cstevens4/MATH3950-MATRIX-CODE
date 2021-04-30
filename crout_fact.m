function crout_fact(n,A)
L = zeros(n);
z= ones(n,1);
U = diag(z);

L(1,1) = A(1,1);
U(1,2) = A(1,2)/L(1,1);
z(1) = A(1,n+1)/L(1,1);

for i=2:n-1
    L(i,i-1) = A(i,i-1);
    L(i,i) = A(i,i) - L(i,i-1)*U(i-1,i);
    U(i,i+1) = A(i,i+1)/L(i,i);
    z(i) = (A(i,n+1) - L(i,i-1)*z(i-1))/L(i,i);
end

L(n,n-1) = A(n,n-1);
L(n,n) = A(n,n) - L(n,n-1)*U(n-1,n);
z(n) = (A(n,n+1)-L(n,n-1)*z(n-1))/L(n,n);

x(n) = z(n);

for i=n-1:-1:1
    x(i) = z(i) - U(i,i+1)*x(i+1);
end

x
end