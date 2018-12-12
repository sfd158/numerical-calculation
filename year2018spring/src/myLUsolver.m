function MX = myLUsolver(A,b)
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
    
    X=zeros(1,3);Y=zeros(1,3);
    Y(1)=b(1);
    for i=2:n    
        for j=1:i-1
            b(i)=b(i)-L(i,j)*Y(j);
        end
        Y(i)=b(i);
    end
 
    X(n)=Y(n)/U(n,n);
    for i=(n-1):-1:1
        for j=n:-1:i+1
            Y(i)=Y(i)-U(i,j)*X(j);
        end
        X(i)=Y(i)/U(i,i);
    end
    
    MX = X';
end