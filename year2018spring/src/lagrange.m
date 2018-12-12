function yy=lagrange(x1,y1,xx)  
syms x  
n=length(x1);  
for i=1:n  
t=x1;t(i)=[];L(i)=prod((x-t)./(x1(i)-t)); 
end  
u=sum(L.*y1);  
yy=double(subs(u,x,xx));
end  