function [] = chiadoi_chosaiso_fval(f,x0,x1,saiso)
format long g;

syms x

dau=double(x0);
cuoi=double(x1);

u=double(feval(f,dau));
v=double(feval(f,cuoi));

if u*v>0 
    fprintf('Phuong trinh vo ngiem trong khoang dang xet\n');
else    
    while (dau+saiso<cuoi)
        giua=double((dau+cuoi)/2);
        
        v=feval(f,giua)*feval(f,dau);
        if v<0 
            cuoi=giua;
        else
            dau=giua;
        end
        
    end
   
    fprintf('Nghiem cua phuong trinh la  :  %f\n',double(dau));   
end
end

