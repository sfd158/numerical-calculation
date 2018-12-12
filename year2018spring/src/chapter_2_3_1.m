clear;clc;
f = @(x)0.5+0.25*x^2-x*sin(x)-0.5*cos(2*x);
x0 = pi*5;
diff_f = @(x)x/2 + sin(2*x) - sin(x) - x*cos(x);              
TOL = 5e-5; N = 1000; CNT = 1; A = x0;
while CNT < N
							CNT = CNT + 1;
							x = x0 - f(x0)/diff_f(x0);
							A(CNT) = x;
							if abs(x - x0) < TOL
                                fprintf('Total time of iteration is %d. The answer is %f.',CNT,A(CNT))
								return;
							end
							x0 = x;
end
disp('No Solution');
                        
                        