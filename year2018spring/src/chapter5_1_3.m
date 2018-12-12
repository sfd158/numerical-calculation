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
    for i=1:n
        K1 = h*f(t,w);
        K2 = h*f(t+h/2,w+K1/2);
        K3 = h*f(t+h/2,w+K2/2);
        K4 = h*f(t+h,w+K3);
        w = w + (K1 + 2*K2 +2*K3 + K4)/6;
        t = t + h;
        A(i+1) = w;
    end
    fprintf('%d %.12f\n',n,g(1)-A(n+1))
    subplot(2,2,tp);
    plot(X,Y,left:(right-left)/n:right,A);
    title(['Runge-Kutta with n =' num2str(n)])
    legend('Initial Function','Runge-Kutta',2)
end



