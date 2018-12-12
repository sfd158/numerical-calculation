clear;clc;
R = [0.154,0.296,0.363,0.531,2.23,3.58,3.52,2.40,0.23,0.357,...
     0.366,0.771,2.01,3.28,2.96,5.10,0.181,0.260,0.334,0.87,...
     3.59,3.40,3.88,0.180,0.299,0.428,1.15,2.83,4.14,0.234,...
     0.537,1.47,2.48,1.44,1.84,4.66,6.94];
W = [0.017,0.087,0.174,1.11,1.74,4.09,5.45,5.96,0.025,0.111,...
     0.211,0.999,3.02,4.28,4.58,4.68,0.020,0.085,0.171,1.29,...
     3.04,4.29,5.30,0.020,0.119,0.210,1.32,3.34,5.48,0.025,...
     0.233,0.783,1.35,1.69,2.75,4.83,5.53];
X = log(W); Y = log(R);
A = mypoly(X,Y);
left = min(X); right = max(X);
f = @(a,b,x)a*x+b;
DrX = [left-1/10*(right-left),right+1/10*(right-left)];
DrY = [f(A(2),A(1),DrX(1)),f(A(2),A(1),DrX(2))];
subplot(1,2,1);

plot(DrX,DrY,'r','LineWidth',2);
hold on;
plot(X,Y,'*b');
legend('Initial Points','Linear Poly Fit',2);
title('lnR = lnb + alnW');
subplot(1,2,2)
b = exp(A(1)); a = A(2);
left = min(W); right = max(W);
X1 = left:(right-left)/50:right; Y1 = W;
for i=1:length(X1)
    Y1(i) = b*X1(i)^a;
end

plot(X1,Y1,'r','LineWidth',2);
hold on;
plot(W,R,'*b');

legend('Initial Points','Poly Fit',2);
title('R = b*W^a')
E = 0;
for i=1:length(X)
    E = E + (R(i) - b*W(i)^a)^2;
end
disp(E)