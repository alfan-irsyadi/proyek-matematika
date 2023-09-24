clc;
clear;
disp('---------------------');
disp('METODE BISEKSI');
disp('Oleh : Favour Get Gea');
disp('---------------------');
y = input ('Input fungsi : ','s');
f = inline (y);
a = input ('Input batas bawah(a)  : ');
b = input ('Input batas atas(b)   : ');
error = input ('Input toleransi error : ');
iterasi = 1;
disp('---------------------------------------------------------------------------------');
disp('  i        a            b          f(a)          f(b)          x           f(x)');
disp('---------------------------------------------------------------------------------');
x=(a+b)/2;
if f(a)*f(b) > 0
    disp ('Tidak ada akar!!!');
else
while abs(b-a)>error && abs(f(x))>error 
x = (a+b)/2;
fprintf('%3g   %10.7f   %10.7f   %10.7f   %10.7f   %10.7f   %10.7f\n',iterasi,a,b,f(a),f(b),x,f(x));
if f(x)*f(a)<0
b = x;
else
a = x;
end
iterasi = iterasi + 1;
end
end
fprintf('Akar persamaan diperoleh di x = %10.7f\n',x);
xg=linspace(-5,5);
yg=f(xg);
plot(xg,yg,'-r','linewidth',1)
title('f(x)=x^3+3x^2-xe^x+1')
xlabel('sumbu x'),ylabel('sumbu y')
hold on
plot(x,0,'.b')
grid on
axis ([-5 5 -10 10])