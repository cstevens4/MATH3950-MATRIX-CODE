function lu_fact(n,A)
for i=1:n
   z(i) = 1; 
end

l = diag(z);
u = zeros(n);

u(1,1) = A(1,1);

if(u(1,1) == 0)
    fprintf('Factorization Impossible');
    return
end

for j=2:n
    u(1,j) = A(i,j)/l(1,1);
    l(j,1) = A(j,1)/u(1,1);
end

for i=2:n-1
   u(i,i) = A(i,i) - sum(l(i,1:(i-1))*u(1:(i-1),i));
   
   if(l(i,i)*u(i,i) == 0)
       fprint('Factorization Impossible')
       return
   end
   
   for j=i+1:n
       u(i,j) = (1/l(i,i))*(A(i,j)-sum(l(i,1:(i-1))*u(1:(i-1),j)));
       l(j,i) = (1/u(i,i))*(A(j,i)-sum(l(j,1:(i-1))*u(1:(i-1),i)));
   end
   
end

u(n,n) = A(n,n)-sum(l(n,(1:n-1))*u((1:n-1),n));

if(l(n,n)*u(n,n) == 0)
    fprint('A is singular')
end

disp(l);
disp(u);

end