function A = mypolyn(x,y,n)
    m = length(x);
    R = ones(m,n+1);
    for i=1:m
        for j=n:-1:1
            R(i,j) = R(i,j+1) * x(i,1);
        end
    end
    %disp(R)
    A = myLUsolver(R'*R, R'*y);
end