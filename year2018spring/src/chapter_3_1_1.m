clear; clc;
f = @(x)1/(1+x*x);
left = -5; right = 5;
X=left:(right-left)/500:right;
P = [];
for n=2:2:10
    step = (right - left) / n;
    A = left:step:right; B = [f(left)];
    for l = 1:n
        B(l+1) = f(A(l+1));
    end
    P = [P;lagrange(A,B,X)];
end
Y0=[];
for l = 1:length(X)
    Y0(l) = f(X(l));
end

subplot(2,3,1);
plot(X,Y0,'LineWidth',2)
legend('Init Func')
title('Initial Func')

subplot(2,3,2);
plot(X,Y0,'LineWidth',2);
hold on
plot(X,P(1,:),'r','LineWidth',2);
legend('Init Func','2-th Poly');
title('2-th Poly');
disp(max(abs(P(1,:)-Y0)))

subplot(2,3,3);
plot(X,Y0,'LineWidth',2);
hold on
plot(X,P(2,:),'r','LineWidth',2);
title('4-th Poly');
legend('Init Func','4-th Poly')
disp(max(abs(P(2,:)-Y0)))

subplot(2,3,4);
plot(X,Y0,'LineWidth',2);
hold on
plot(X,P(3,:),'r','LineWidth',2)
legend('Init Func','6-th Poly')
title('6-th Poly');
disp(max(abs(P(3,:)-Y0)))

subplot(2,3,5);
plot(X,Y0,'LineWidth',2);
hold on
plot(X,P(4,:),'r','LineWidth',2)
legend('Init Func','8-th Poly')
title('8-th Poly');
disp(max(abs(P(4,:)-Y0)))

subplot(2,3,6);
plot(X,Y0,'LineWidth',2);
hold on
plot(X,P(5,:),'r','LineWidth',2)
legend('Init Func','10-th Poly')
title('10-th Poly');
disp(max(abs(P(5,:)-Y0)))
%plot(X,Y0,X,P(1,:),X,P(2,:),X,P(3,:),X,P(4,:),X,P(5,:))
%legend('Initial Function','Lagrange function:2th','4th','6th','8th','10th');