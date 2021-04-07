function backsub(n,A)

for i=1: n-1
    p=-1;
    p=find(A(i:n,i),1,'first')+i-1;
    
    if p<=0
       display("No unique solution exists")
       break
    end
    
    if p ~= i 
        temp = A(i,:);
        A(i,:) = A(p,:);
        A(p,:) = temp;
        
    end
    
    for j=i+1: n
        m = A(j,i)/A(i,i);
        A(j,:) = A(j,:)-m*A(i,:);
    end
end

if A(n,n) == 0
    display("No unique solutions exists")
end

x(n) = A(n,n+1)/A(n,n);

for i = n-1:-1:1
    sum = 0;
    for j=i+1:n
        sum = sum + A(i,j) * x(j);
    end
    x(i) = (A(i,n+1) - sum) / A(i,i);
end
display(x)
end