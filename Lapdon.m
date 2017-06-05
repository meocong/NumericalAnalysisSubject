function [] = Lapdon(A,b,saiso)

B = -(A-10*eye(size(A,1)))/10;
g = b/10;

chuanb = max(sum(abs(B)));
hangso = chuanb/(1-chuanb);

if (norm(B) >= 1)
    fprintf('Phuong phap nay khong chay duoc \n');
    return;
end

x0 = zeros(size(b,1), 1);

solanlap = 1;
x1 = B*x0 + g;
x2 = x1;

while hangso* max(abs(x2 - x0)) > saiso 
    hangso = hangso * chuanb;
    solanlap = solanlap + 1;
    x1 = B*x1 + g;
end

fprintf('So lan lap la : ');
    disp(solanlap);
    disp(x1);

end

