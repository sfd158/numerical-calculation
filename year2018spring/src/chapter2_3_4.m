f = inline('5*x-exp(x)','x');
TOL = 5e-5; N = 100; CNT = 0;
p0 = 0; p1 = 1;
q0 = f(p0); q1 = f(p1);
while CNT < N
    CNT = CNT + 1
    p = p1 - q1*(p1-p0)/(q1-q0);
    if abs(p-p1) < TOL
        break
    end
    q = f(p)
    if q*q1 < 0
        p0=p; q0=q;
    else
        p1=p; q1=q;
    end
end
fprintf('Total time of iteration is %d. The answer is %.4f.',CNT,p)