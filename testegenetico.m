
clear all;
clc;

disp('Digite N: ');
N = input('');

mi = randi([0 1], [N N])

soma = zeros(N,1);
for i = 1:N
    cont = 1;
    for k = N:1
        soma(i,1) = mi(i,cont)*(10.^k-1) + soma(i,1);
        cont = cont + 1;
    end
    
end

soma



