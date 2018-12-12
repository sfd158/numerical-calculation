f = inline('5*x-exp(x)','x');
diff_f = inline('5-exp(x)','x');
TOL = 5e-5; N = 100; CNT = 0;
x0 = 0;
while CNT < N
    CNT = CNT + 1;
    x = x0 - f(x0)/diff_f(x0);
    if abs(x - x0) < TOL
        break;
    end
    x0 = x;
end
fprintf('Total time of iteration is %d. The answer is %.4f.',CNT,x0)