clear;
left = 0; right = 30; y1_0 = 1; y2_0 = 0;
n = 3000; h = (right-left)/n; miu_lst = [10, 1, 0.1];
f1 = @(t,y1,y2)y2; P = [];
for tp=1:length(miu_lst)
    miu = miu_lst(tp);
    f2 = @(t,y1,y2)miu*(1-y1*y1)*y2 - y1;
    y1 = y1_0; y2 = y2_0; A = [y1];
    for i=1:n
        t = left + i*h;
        K11 = h*f1(t, y1, y2);
        K21 = h*f2(t, y1, y2);
    
        K12 = h*f1(t + h/2, y1 + K11/2, y2 + K21/2);
        K22 = h*f2(t + h/2, y1 + K11/2, y2 + K21/2);
    
        K13 = h*f1(t + h/2, y1 + K12/2, y2 + K22/2);
        K23 = h*f2(t + h/2, y1 + K12/2, y2 + K22/2);
    
        K14 = h*f1(t + h, y1 + K13, y2 + K23);
        K24 = h*f2(t + h, y1 + K13, y2 + K23);
    
        y1 = y1 + (K11 + 2*K12 + 2*K13 + K14)/6;
        y2 = y2 + (K21 + 2*K22 + 2*K23 + K24)/6;
        A(i+1) = y1;
    end
    subplot(2,2,tp);
    plot(left:(right-left)/n:right,A);
    title(['with mu = ' num2str(miu)]);
    P = [P; A];
end
subplot(2,2,4); X = left:(right-left)/n:right;
plot(X,P(1,:),X,P(2,:),X,P(3,:));
title('All')
legend(['with mu = ' num2str(miu_lst(1))],['with mu = ' num2str(miu_lst(2))],['with mu = ' num2str(miu_lst(3))])

