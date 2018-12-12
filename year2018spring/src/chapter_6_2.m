clear;
A = [2,-1,0;-1,2,-1;0,-1,2]; n = length(A);
d = zeros(n,n); L = eye(n,n);
d(1,1) = A(1,1);
for j=2:n,L(j,1) = A(1,j)/d(1,1); end
for i=2:n
    d(i,i) = A(i,i);
    for j=1:i-1
        d(i,i) = d(i,i) - L(i,j)^2 * d(j,j);
    end
    for j=i+1:n
        L(j,i) = A(i,j);
        for k=1:i-1
            L(j,i) = L(j,i) - L(i,k)*L(j,k)*d(k,k);
        end
        L(j,i) = L(j,i)/d(i,i);
    end
end
disp(L*sqrt(d))