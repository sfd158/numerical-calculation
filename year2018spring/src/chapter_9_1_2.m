clear;
A = [4,-1,1;-1,3,-2;1,-2,3]; n = length(A);
x = [1;1;1]; N = 1000; TOL = 1e-7;
x = x/norm(x,2);
B = x;
for i = 1:N
    y = A*x;
    u = x'*y;
    if norm(y,2) < 1e-10
        fprintf('A has eigen value 0. select new vector x and restart.\n')
        return
    end
    norm_y = norm(y,2);
    err = norm(x-y/norm_y,2);
    x = y/norm_y;
    B(i+1) = u;
    if err < TOL
        fprintf('Answer %f Iteration time %d\n',u,i)
        disp(x')
        disp(B);
        plot(1:length(B),B,'r-');
        hold on;
        plot(1:length(B),B,'ob');
        xlabel('Iteration times');
        ylabel('Eigen Value Sequence');
        title('Iteration Sequence')
        return
    end
end
fprintf('No Solution\n')