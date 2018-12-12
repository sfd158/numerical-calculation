f = inline('5*x-exp(x)','x');
TOL = 5e-5;
N = 100;
Left = 0.0;
Right = 1.0;
FL = f(Left);
CNT = 0;
Mid = 0;
while CNT < N
    CNT = CNT + 1;
    Mid = (Left + Right)/2;
    FMid = f(Mid);
    if FL*FMid < 0
        Right = Mid;
    else
        if FL*FMid == 0
            break
        else
            FL = FMid;
            Left = Mid;
        end
    end
    if Right - Left < TOL
        break
    end
end
fprintf('Total time of iteration is %d. The answer is %.4f.',CNT,Mid)