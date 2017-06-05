function [xx, yy] = EulerCaiTien(f,x0,y0,n,x1)
syms x y
format long g

h = (x1 - x0)/n;
xx = zeros(1, n);
yy = zeros(1, n);
xx(1) = x0;
yy(1) = y0;

for i=2:n
    xx(i) = xx(i-1) + h;
    fxy = double(subs(f, {x, y}, {xx(i-1), yy(i-1)}));
    ynga = yy(i-1) + h*fxy;
    yy(i) = yy(i-1) + (fxy + subs(f,{x, y},{xx(i), ynga}))*h/2;
end
end

