clear;
left = 0; right = 1;
f = @(x,y)y - 2*x/y; y0 = 1;
n_lst = [10, 20, 100 ,1000];
g = @(x)sqrt(2*x+1);
X = left:(right - left)/50:right;
Y = [];
for i = 1:length(X)
    Y(i) = g(X(i));
end

for tp=1:length(n_lst)
    n = n_lst(tp); h = (right-left)/n;
    t = left; w = y0; A = [y0];
    for i=1:3
        K1 = h*f(t,w);
        K2 = h*f(t+h/2,w+K1/2);
        K3 = h*f(t+h/2,w+K2/2);
        K4 = h*f(t+h,w+K3);
        w = w + (K1 + 2*K2 +2*K3 + K4)/6;
        t = t + h;
        A(i+1) = w;
    end
    w3 = A(4); w2 = A(3); w1 = A(2); w0 = A(1);
    t3 = left + 3*h; t2 = left + 2*h; t1 = left + h; t0 = left;
    for i=4:n
        t = t + h;
        w = w3 + h*(55*f(t3,w3) - 59*f(t2,w2) +37*f(t1,w1)-9*f(t0,w0))/24;
        w = w3 + h*(9*f(t,w) + 19*f(t3,w3) - 5*f(t2,w2) + f(t1,w1))/24;
        t0 = t1; t1 = t2; t2 = t3; t3 = t;
        w0 = w1; w1 = w2; w2 = w3; w3 = w; A(i+1) = w;
    end
    fprintf('%d %.12f\n',n,A(n+1))
    subplot(2,2,tp);
    plot(X,Y,left:(right-left)/n:right,A);
    title(['Predictor-Corrector with n =' num2str(n)])
    legend('Initial Function','Predictor-Corrector',2)
end