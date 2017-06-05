function [xx, yy] = Euler(f,x0,y0,n,x1)
syms x y
format long g

h = (x1 - x0)/n;
xx = zeros(1, n);
yy = zeros(1, n);
xx(1) = x0;
yy(1) = y0;

for i=2:n
    xx(i) = xx(i-1) + h;
    yy(i) = yy(i-1) + h*double(subs(subs(f,x,xx(i)),y,yy(i-1)));
end
end

