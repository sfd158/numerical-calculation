clear;clc;
A = [4,-1,1;-1,3,-2;1,-2,3]; n = length(A); TOL = 1e-7;
Ma = zeros(1,n);
for i=1:n
    for j=1:n
        if i==j
            Ma(i) = Ma(i) + A(i,i);
        else
            Ma(i) = Ma(i) + abs(A(i,j));
        end
    end
end
change = max(Ma) + 2; A = A - change*eye(n);
L=eye(n,n); U=zeros(n,n);
for k=1:n
    for j=k:n
        U(k,j)=A(k,j)-sum(L(k,1:k-1).*U(1:k-1,j)');
    end
    for i=k+1:n
        L(i,k)=(A(i,k)-sum(L(i,1:k-1).*U(1:k-1,k)'))/U(k,k);
    end
end
x0 = [1;1;1]; MAXN = 100; mx0 = max(x0);y0 = x0/mx0;
B = mx0;
for CNT = 1:MAXN
    b = y0;
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
    x = X';mx = max(x); y0 = x/mx;
    B(CNT+1) = mx;
    if abs(mx-mx0) < TOL
        fprintf('Answer %f Iteration time %d\n',change-1/mx,CNT)
        disp(x)
        disp(B);
        plot(1:length(B),B,'-r');
        hold on;
        plot(1:length(B),B,'ob');
        return
    end
    x0 = x; mx0 = mx;
end
fprintf('No solution')