%clear; clc;

                    F = {'@(x)15-2*x*x'; '@(x)15/(2*x+1)'; '@(x)x - (2*x*x+x-15)/(4*x+1)'};
					N = 1000; x0=2;A=zeros(3,N); TOL = 1e-5;
                    A(1,1) = x0; A(2,1) = x0; A(3,1)=x0; mysize = [1,1,1];
                    for tp=1:3
                        tmp = F(tp); 
                        i = 2; f = str2func(tmp{1});
                        while i < N
                            A(tp,i) = f(A(tp,i-1));
                            if abs(f(A(tp,i)) - A(tp,i)) < TOL
                                fprintf('Function %d: ',tp);
                            	fprintf('Answer %f Iteration times %d\n',A(tp,i),i);
                                mysize(tp) = i;
                                break;
                            end
                            i = i+1;
                        end
                        if i >= N
                            fprintf('Function %d: Not convergence.\n',tp);
                        end
                    end
                    
                         