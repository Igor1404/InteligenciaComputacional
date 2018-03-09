clear all
clc
disp('Calculadora de algoritmo geneticos!');


disp('criação de uma matriz de bits: ');
fprintf('Digite o numero de bits: ');
k = input(''); 
mi = randi([0 1], [k k]);

for i = 1:k
    for j = 1:k
        v(j) = int2str(mi(i,j));   
    end
    teste(i) = v(j);
end

for i = 1:k
  melhor(i) = str2int(teste(i));
  melhordec = bin2dec(melhor(i));
end




fprintf('Digite o valor minimo inicial: ');
inferior = input('');

fprintf('Digite o valor maximo inicial: ');
superior = input('');


disp('Apresentação dos elementos');

mi
inferior 
superior 
k
melhordec