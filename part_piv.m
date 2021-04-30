function part_piv(n, A)
%Step 1
for i=1:n
    nrow(i) = i;
end
%Step 2
for i=1:n-1
    %Step 3
    p = 0;
    [s p] = max(abs(A(nrow(i:n-1),i)));
    p=p+i-1;
    %Step 4
    if A(nrow(p),i) == 0
        display("No unique solution")
    end
    %Step 5
    if nrow(i) ~= nrow(p)
        ncopy = nrow(i);
        nrow(i) = nrow(p);
        nrow(p) = ncopy;
    end
end
%Step 6
for j=i+1:n
    %Step 7
    m= A(nrow(j),i)/A(nrow(i),1);
    %Step 8
    A(nrow(j),:) = A(nrow(j),:) - m * A(nrow(i),:);
end
%Step 9
if A(nrow(n),n) == 0
    display("No unique solution")
end
%Step 10
x = zeros(1,n);
x(n) = A(nrow(n), n+1)/A(nrow(n), n);
for i = n-1:-1:1
    x(i) = (A(nrow(i), n+1) - sum(A(nrow(i), 1:n) .* x))/A(nrow(i), i);
end
%Step 12
display(x)
end