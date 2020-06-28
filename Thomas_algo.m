function x=Thomas_algo(r,d)%开始使用托马斯算法，追赶法
%目的是不用求矩阵的逆，来求出三对角矩阵线性方程的解
n=length(d);
%生成A矩阵
A=zeros(n,n);
A(1,1)=1+2*r;A(1,2)=-r;
A(end,end)=1+2*r;A(end,end-1)=-r;
for i=2:n-1    
    A(i,i-1)=-r;
    A(i,i)=1+2*r;
    A(i,i+1)=-r;
end
%将A矩阵分解为L*U的，并将L和U的值储存在A中
b=d;
for i = 2: n
    A(i,i-1) = A(i,i-1)/A(i-1,i-1);
    A(i,i) = A(i,i) - A(i-1,i) * A(i,i-1);
    %Ux=L^(-1)*b, 将b向量替换为L^(-1)*b
    b(i) = b(i) - b(i-1) * A(i,i-1);
end
%接下来求x的值，先把U矩阵分离出来
for i=1:n-1
    A(i+1,i)=0;
end
%此时A就是U矩阵
x=zeros(1,n);
x(n) = b(n) / A(n,n); %先算出x的最后一个值，再依次往前迭代通过显式方程求解
for i = n-1:-1: 1
    x(i) = (b(i) - A(i,i+1) * x(i+1)) / A(i,i);
end


end















