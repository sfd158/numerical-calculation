clear;
left = 0; right = pi/2; h = pi/80;
f = @(x)exp(sin(x));
tot = 0; tp = f(left);
for i=left+h:h:right
    tr = f(i);
    tot = tot + h/2*(tp + tr);
    tp = tr;
end
fprintf('ans = %f\n',tot)