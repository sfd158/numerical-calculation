f = inline('5*x-exp(x)','x');
TOL = 5e-5; N = 100; CNT = 0;
x0 = 1; x1 = 0;
while CNT < N
    CNT = CNT + 1;
    x = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0))
    if abs(x - x1) < TOL
        break;
    end
    x0 = x1;
    x1 = x;
end
fprintf('Total time of iteration is %d. The answer is %.4f.',CNT,x0)