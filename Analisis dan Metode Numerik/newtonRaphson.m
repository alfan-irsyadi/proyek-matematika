clear
clc
disp(' ______     __         ______   ______     __   __    ')
disp('/\  __ \   /\ \       /\  ___\ /\  __ \   /\ "-.\ \   ')
disp('\ \  __ \  \ \ \____  \ \  __\ \ \  __ \  \ \ \-.  \  ')
disp(' \ \_\ \_\  \ \_____\  \ \_\    \ \_\ \_\  \ \_\\"\_\ ')
disp('  \/_/\/_/   \/_____/   \/_/     \/_/\/_/   \/_/ \/_/')
disp('======================================================')
disp('Metode Newton Raphson:');
disp('------------------------------------------------------')
syms x
fx = input('Masukkan sebuah fungsi      : ');
x0 = input('Masukkan nilai awalan       : ');
N =  input('Masukkan iterasi maksimum   : ');
e = input ('Masukkan nilai toleransi    : ');
df = inline(diff(fx,x));
f = inline(fx);
i = 1;
T = table;
figure
hold on;

while(i <= N)
    x1 = x0 - f(x0)/df(x0);
    
    plot([x0 x1], [f(x0) 0], '-g')
    plot([x0 x0], [f(x0) 0], '--s','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]);
    err = abs(x1-x0);
   
    T(i,:) = {i x0 f(x0) df(x0) err};
    x0 = x1;
    
    i=i+1;
    if(err <  e ) break;
    end
end
T.Properties.VariableNames = {'i', 'x', 'fx' 'dfx' 'error'};
n = abs(min(T.x) - max(T.x));
ny = abs(min(T.fx)-max(T.fx));


X=linspace(min(T.x)-n*0.1, max(T.x)+n*0.1);
fplot(f(x), [min(T.x)-n*0.1, max(T.x)+n*0.1])
ylim([min(T.fx)-ny*0.1, max(T.fx)+ny*0.1]);
format long
disp(T)
grid on;
axis on;
xL = xlim;
yL = ylim;
line([0 0], yL);  %x-axis
line(xL, [0 0]);  %y-axis
title(sprintf('%s', fx));
xlabel('Sumbu X') 
ylabel('Sumbu Y')
hold off;
fprintf('\nhampiran akar dari fungsi %s tersebut: %.8f\n',fx, T.x(i-1));