function [ ] = LapJacobi(A,b,x0,nmax,saiso)
format long g
if (size(A,1) ~= size(A,2))
    disp('Ban phai nhap A la ma tran vuong');
    return;
end

n = size(A,1);

if (n ~= size(b,1)) 
    disp('Ban nhap sai input');
    return;
end

for i = 1:n 
    for j = 1:n 
        if (i~=j && abs(A(i,j)) > abs(A(i,i)))
            disp('Ban nhap khong phai ma tran cheo troi');
            return;
        end
    end
end

B = A;
for i = 1:n 
    for j = 1:n 
        if (i == j) 
            B(i,j) = 0;
        else
            B(i,j) = -A(i,j)/A(i,i);
        end
    end
end

solanlap = 1;
b = b./diag(A);
x1 = x0;
x2 = b + B*x1;
chuanb = norm(B,1);
chuanbk = chuanb*norm(x2-x1,1)/(1-chuanb);

while (chuanbk> saiso && solanlap <nmax )
    x1 = x2;
    x2 = b + B*x1;
    solanlap = solanlap + 1;
    chuanbk = chuanbk * chuanb;
end

disp('Nghiem he phuong trinh la : ');
disp(x2);
fprintf('So lan lap la : ');
disp(solanlap);
end

