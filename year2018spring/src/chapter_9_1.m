clear;
A = [4,-1,1;-1,3,-2;1,-2,3]; n = length(A);
x0 = [1;1;1]; y0 = x0; N = 100; TOL = 1e-7;
mx0 = max(x0); B = mx0;
for i=1:N
    x = A*y0; mx = max(x);
    y0 = x/mx;
    B(i+1) = mx;
    if abs(mx-mx0) < TOL
        fprintf('Answer %f Iteration time %d\n',mx,i)
        disp(x)
        disp(B)
        plot(1:length(B),B,'ob');
        hold on
        plot(1:length(B),B,'r-');
        xlabel('Iteration times');
        ylabel('Eigen Value');
        title('Iteration Sequence');
        return
    end
    x0 = x; mx0 = mx;
end
fprintf('No Solution\n')