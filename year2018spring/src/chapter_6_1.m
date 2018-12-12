clear;
A  = [2,-1,1; 3,3,9; 3,3,5]
n = length(A);
L=eye(n,n); U=zeros(n,n);
for k=1:n
    for j=k:n
        U(k,j)=A(k,j)-sum(L(k,1:k-1).*U(1:k-1,j)');
    end
    for i=k+1:n
        L(i,k)=(A(i,k)-sum(L(i,1:k-1).*U(1:k-1,k)'))/U(k,k);
    end
end
disp(L)
disp(U)