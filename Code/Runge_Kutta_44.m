function [TT, YY] = Runge_Kutta_44(f, t0, tn, y0, n)
syms t y
format long g

h = (tn-t0)/n;
TT = zeros(1,n);
YY = TT;
TT(1) = t0;
YY(1) = y0;

for i = 2 : n
    TT(i) = TT(i-1) + h;
    
    u = TT(i-1);
    v = YY(i-1);
    k1 = h * double(subs(f, {t,y}, {u,v}));
    k2 = h * double(subs(f, {t,y}, {u + h/2,v + k1/2}));
    k3 = h * double(subs(f, {t,y}, {u + h/2,v + k2/2}));
    k4 = h * double(subs(f, {t,y}, {u + h  ,v + k3}));
   
    YY(i) = double(YY(i-1) + (k1 + 2*k2 + 2*k3 + k4)/6);
end

plot(TT,YY);
hold on 
YY = 2*exp(TT) - TT - 1;
plot(TT,YY);
end

