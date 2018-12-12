clear;
A = [4,3,0; 3,4,-1; 0,-1,4]; b = [24,30,-24];
x = [1,1,1]; TOL = 1e-6; N = 100; x0 = x;
for k=1:N
    for i=1:length(x)
        x(i) = b(i);
        for j=1:length(x)
            if j == i, continue; end
            x(i) = x(i) - A(i,j)*x(j);
        end
        x(i) = x(i)/A(i,i);
    end
    if norm(x-x0,Inf) < TOL
        fprintf('Answer = (%f,%f,%f), Iteration times: %d\n',x(1),x(2),x(3),k)
        return
    end
    x0 = x;
end
fprintf('No solution.\n')