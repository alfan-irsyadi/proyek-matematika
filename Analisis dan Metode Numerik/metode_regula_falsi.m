function 
clear;
clc;
disp(' ______     __         ______   ______     __   __    ')
disp('/\  __ \   /\ \       /\  ___\ /\  __ \   /\ "-.\ \   ')
disp('\ \  __ \  \ \ \____  \ \  __\ \ \  __ \  \ \ \-.  \  ')
disp(' \ \_\ \_\  \ \_____\  \ \_\    \ \_\ \_\  \ \_\\"\_\ ')
disp('  \/_/\/_/   \/_____/   \/_/     \/_/\/_/   \/_/ \/_/')
disp('======================================================')
disp('Metode Regula Falsi:');
disp('------------------------------------------------------')
g = input ('Masukkan Fungsi f(x) : ', 's');
f = inline(g,'x');
e = input('error       : ');
a = input('a           : ');
b = input('b           : ');
n = input('iterasi maks: ');
i=1;
x= (f(b)*a-f(a)*b)/(f(b)-f(a));
T = table;
if f(a)*f(b)>0
    disp('Tidak ada akar, karena f(a) dan f(b) memiliki tanda yang sama');
else
    hold on;
    xx = linspace(a-(b-a)*2/10, b+(b-a)*2/10);
    plot(xx, f(xx), '-g');
    plot([a a], [f(a) 0], '-ro');
    plot([b b], [f(b) 0], '-ro');
    
    while(abs(a-b)>e && i<n && abs(f(x))>e)
        plot([x x], [f(x) 0], '-ro');
        x= (f(b)*a-f(a)*b)/(f(b)-f(a));
        T(i,:) = {i a b x f(a) f(b) f(x)};
        
        i=i+1; 
        
        
        if f(a)*f(x) < 0
            b=x;
        else
            a=x;
        end
    end
    
    grid on;
    axis on;
    xL = xlim;
    yL = ylim;
    line([0 0], yL);  %x-axis
    line(xL, [0 0]);  %y-axis
    line([x x], yL, 'Color', 'red', 'LineStyle', '--');  %y-axis
    T(i,:) = {i a b x f(a) f(b) f(x)};
    T.Properties.VariableNames = {'i', 'a', 'b' 'x' 'fa' 'fb' 'fx'};
    disp(T);
    title(g);
    hold off;
    fprintf('\nHampiran akar fungsi %s adalah %g\n', g, x);
end