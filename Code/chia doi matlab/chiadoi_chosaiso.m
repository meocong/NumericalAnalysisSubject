function [] = chiadoi_chosaiso(f,x0,x1,saiso)
format long g;

syms x

dau=double(x0);
cuoi=double(x1);

u=double(subs(f,x,dau));
v=double(subs(f,x,cuoi));

if u*v>0 
    fprintf('Phuong trinh vo ngiem trong khoang dang xet\n');
else    
    while (dau+saiso<cuoi)
        giua=double((dau+cuoi)/2);
        
        v=subs(f,x,giua)*subs(f,x,dau);
        if v<0 
            cuoi=giua;
        else
            dau=giua;
        end
        
    end
   
    fprintf('Nghiem cua phuong trinh la  :  %f\n',double(dau));   
end
end

