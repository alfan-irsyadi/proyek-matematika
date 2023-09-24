clear
clc
disp(' ______     __         ______   ______     __   __    ')
disp('/\  __ \   /\ \       /\  ___\ /\  __ \   /\ "-.\ \   ')
disp('\ \  __ \  \ \ \____  \ \  __\ \ \  __ \  \ \ \-.  \  ')
disp(' \ \_\ \_\  \ \_____\  \ \_\    \ \_\ \_\  \ \_\\"\_\ ')
disp('  \/_/\/_/   \/_____/   \/_/     \/_/\/_/   \/_/ \/_/')
disp('======================================================')
disp('Metode Eliminasi Gauss:');
disp('------------------------------------------------------')
A = input('Masukkan Matriks       :  ');
B = input('Masukkan Matriks Hasil :  ');
a= [A, B']
s=length(A);
for j=1:s-1
    for i=j+1:s
        a(i,:)=a(j,:)-a(j,j)*(a(i,:))/a(i,j);
        i=i+1;
    end
    disp(a)
    pause
end
x=zeros(s,1);
pause
x(s)=a(s,s+1)/a(s,s)
pause
for i=s-1:-1:1
    sum=0;
    for k = i:s
        sum = sum+a(i,k)*x(k);
    end
    x(i)=a(i,s+1)-sum;
    x(i)=x(i)/a(i,i)
end
disp('Maka solusi dari persamaan tersebut adalah')
disp(x')
