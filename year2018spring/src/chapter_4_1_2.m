clear;
f = @(x)exp(sin(x));
left = 0; right = pi/2;
n = 4000; h = (right - left) / n;
tot = f(left) + f(right);
for j=1:n/2-1
    tot = tot + 2*f(left + 2*j*h);
end
for j=1:n/2
    tot = tot + 4*f(left + (2*j-1)*h);
end
fprintf('ans = %.12f\n',h*tot/3)