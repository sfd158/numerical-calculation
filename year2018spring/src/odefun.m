function y = odefun(t,x)
    y = zeros(2,1);
    y(1) = x(2);
    y(2) = -t*x(1)+exp(t)*x(2)+3*sin(2*t);
end