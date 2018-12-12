function A = mypoly(x,y)
    sx = 0; sx2 = 0; n = length(x);
    sxy = 0; sy = 0;
    for i=1:n
        sx2 = sx2+x(i)*x(i);
        sy = sy + y(i);
        sx = sx + x(i);
        sxy = sxy + x(i)*y(i);
    end
    A = [0,0];
    A(1) = (sx2 * sy - sxy * sx)/(n*sx2 - sx*sx);
    A(2) = (n*sxy - sx*sy)/(n*sx2 - sx*sx);
end