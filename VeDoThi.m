function [SoDinh, Bac] = VeDoThi(A,r )

SoDinh = 0;

n = size(A,1);
m = size(A,2);
Bac = zeros(n,m);

r = r^2;

DinhX = zeros(1,n*n);
DinhY = zeros(1,n*n);

DinhCanhX = zeros(2,3*n*n);
DinhCanhY = zeros(2,3*n*n);

Free = zeros(16*16*8*n*n,4);
temp = round(r^0.5);
PhanPhoiDinh = zeros(1,(2*temp + 1)^2);
dem = 0;

for i = 1:n 
    for j = 1:m 
        if (A(i,j) == 1)
            BacCuaDinh = 1;
            SoDinh = SoDinh +  1;
            DinhX(SoDinh) = j;
            DinhY(SoDinh) = n-i+1;
            %plot(j,n-i+1,'*');
            for x = i - r : i + r
                for y = j - r : j + r
                        if ((i ~=x || j~=y) && x>=1 && x<=n && y>=1 && y<=m && ((x-i)^2 + (y-j)^2) <= r)
                            if (A(x,y) == 1)
                                dem = dem + 1;
                                BacCuaDinh = BacCuaDinh + 1;
                                Free(dem,:) = [i j x y];
                                DinhCanhX(1,dem) = j;
                                DinhCanhX(2,dem) = y;
                                DinhCanhY(1,dem) = n-i+1;
                                DinhCanhY(2,dem) = n-x+1;
                                %plot([j, y],[n-i+1, n-x+1],'-');
                                Bac(i,j) = Bac(i,j) + 1;
                            end
                        end
                 end
            end
            %BacCuaDinh
            PhanPhoiDinh(BacCuaDinh) = PhanPhoiDinh(BacCuaDinh) + 1;
        end
    end
end

plot(DinhX,DinhY,'*');
hold on;
plot(DinhCanhX,DinhCanhY,'-');
hold on;
plot(0,0,'.');

for i = 1:n 
    for j = 1:m 
        if (Bac(i,j) > 0 )
            x = num2str(Bac(i,j));
            text(j+ 0.1,n-i+1+0.1,x);
        end
    end
end

figure;
PhanPhoiDinhX = 0:(2*temp+1)^2-1;
bar(PhanPhoiDinhX, PhanPhoiDinh)

sotamgiac = 0;
for i = 1 : dem
    u = Free(i,:);
    for j = i + 1 : dem
        v = Free(j,:);
        if (u(1) ~= v(1) || (u(1) == v(1) && u(2) ~= v(2) ))
            break;
        end
        if ((u(3) - v(3))^2 + (u(4) - v(4))^2 <= r) 
            sotamgiac = sotamgiac + 1;
        end
    end
end
sotamgiac = sotamgiac / 3;
fprintf('So tam giac la %d\n',sotamgiac);

sotamgiac = 0;
for i = 1 : dem
    u = Free(i,:);
    for j = i + 1 : dem
        v = Free(j,:);
        if (u(1) ~= v(1) || (u(1) == v(1) && u(2) ~= v(2) ))
            break;
        end
        if ((u(3) - v(3))^2 + (u(4) - v(4))^2 > r) 
            sotamgiac = sotamgiac + 1;
        end
    end
end

fprintf('So goc la %d\n',sotamgiac);

end

