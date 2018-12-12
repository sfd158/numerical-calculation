clear;
left = 0; right = 1;
f = @(x,y)y - 2*x/y; y0 = 1;
n_lst = [10, 20, 100 ,1000];
g = @(x)sqrt(2*x+1);
X = left:(right - left)/500:right;
Y = X;
for i = 1:length(X)
    Y(i) = g(X(i));
end
for tp = 1:length(n_lst)
    n = n_lst(tp); h = (right - left) / n;
    A = y0;
    for i = 2:n+1
        A(i) = A(i-1) + h * f(left + (i-2)*h, A(i-1));
    end
    fprintf('Calc Val: %.8f Err: %.8f\n',A(n+1),g(1)-A(n+1));
    subplot(2,2,tp);
    hold on;
    plot(X,Y,'b','LineWidth',2);
    plot(left:(right-left)/n:right,A,'r','LineWidth',2);
    title(['Euler Method with n =' num2str(n)])
    legend('Initial Function','Euler Method',2)
end