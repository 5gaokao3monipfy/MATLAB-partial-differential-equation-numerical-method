function x=Thomas_algo(r,d)%��ʼʹ������˹�㷨��׷�Ϸ�
%Ŀ���ǲ����������棬��������ԽǾ������Է��̵Ľ�
n=length(d);
%����A����
A=zeros(n,n);
A(1,1)=1+2*r;A(1,2)=-r;
A(end,end)=1+2*r;A(end,end-1)=-r;
for i=2:n-1    
    A(i,i-1)=-r;
    A(i,i)=1+2*r;
    A(i,i+1)=-r;
end
%��A����ֽ�ΪL*U�ģ�����L��U��ֵ������A��
b=d;
for i = 2: n
    A(i,i-1) = A(i,i-1)/A(i-1,i-1);
    A(i,i) = A(i,i) - A(i-1,i) * A(i,i-1);
    %Ux=L^(-1)*b, ��b�����滻ΪL^(-1)*b
    b(i) = b(i) - b(i-1) * A(i,i-1);
end
%��������x��ֵ���Ȱ�U����������
for i=1:n-1
    A(i+1,i)=0;
end
%��ʱA����U����
x=zeros(1,n);
x(n) = b(n) / A(n,n); %�����x�����һ��ֵ����������ǰ����ͨ����ʽ�������
for i = n-1:-1: 1
    x(i) = (b(i) - A(i,i+1) * x(i+1)) / A(i,i);
end


end















