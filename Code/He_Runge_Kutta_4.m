function [TT, XX, YY, ZZ] = He_Runge_Kutta_4(fx, fy, fz, t0, tn, x0, y0, z0, n)
syms t x y z
format long g

h = (tn-t0)/n;
TT = zeros(1,n);
TT(1) = t0;
XX = zeros(1,n);
XX(1) = x0;
YY = zeros(1,n);
YY(1) = y0;
ZZ = zeros(1,n);
ZZ(1) = z0;

for i = 2 : n
    TT(i) = TT(i-1) + h;
    
    tt = TT(i-1);
    xt = XX(i-1);
    yt = YY(i-1);
    zt = ZZ(i-1);
    
    kx1 = double(h * subs(fx, {t,x,y,z}, {tt,xt,yt,zt}));
    ky1 = double(h * subs(fy, {t,x,y,z}, {tt,xt,yt,zt}));
    kz1 = double(h * subs(fz, {t,x,y,z}, {tt,xt,yt,zt}));
    
    kx2 = double(h * subs(fx, {t,x,y,z}, {tt + h/2,xt + kx1/2, yt + ky1/2, zt + kz1/2}));
    ky2 = double(h * subs(fy, {t,x,y,z}, {tt + h/2,xt + kx1/2, yt + ky1/2, zt + kz1/2}));
    kz2 = double(h * subs(fz, {t,x,y,z}, {tt + h/2,xt + kx1/2, yt + ky1/2, zt + kz1/2}));
    
    kx3 = double(h * subs(fx, {t,x,y,z}, {tt + h/2,xt + kx2/2,yt + ky2/2,zt + kz2/2}));
    ky3 = double(h * subs(fy, {t,x,y,z}, {tt + h/2,xt + kx2/2,yt + ky2/2,zt + kz2/2}));
    kz3 = double(h * subs(fz, {t,x,y,z}, {tt + h/2,xt + kx2/2,yt + ky2/2,zt + kz2/2}));
    
    kx4 = double(h * subs(fx, {t,x,y,z}, {tt + h, xt + kx3, yt + ky3, zt + kz3}));
    ky4 = double(h * subs(fy, {t,x,y,z}, {tt + h, xt + kx3, yt + ky3, zt + kz3}));
    kz4 = double(h * subs(fz, {t,x,y,z}, {tt + h, xt + kx3, yt + ky3, zt + kz3}));
   
    XX(i) = double(XX(i-1) + (kx1 + 2*kx2 + 2*kx3 + kx4)/6);
    YY(i) = double(YY(i-1) + (ky1 + 2*ky2 + 2*ky3 + ky4)/6);
    ZZ(i) = double(ZZ(i-1) + (kz1 + 2*kz2 + 2*kz3 + kz4)/6);
end

plot3(XX,YY,ZZ);
end

