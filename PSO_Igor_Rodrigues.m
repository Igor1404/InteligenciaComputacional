%Trabalho de Avalia��o Final de Intelig�ncia Computacional
%Nome: Igor Rodrigues Cardoso
%Matricula: 0323478
%Prof: Jarbas Joacir


%Utiliza��o do PSO(Ou Enxame de particulas) para calcular o minimos de
%fun��es polinomiais utilizando a seguinte fun��o: 
%F(x,y) =(1-x�)+100(y - x�)�


%Fun��o a ser minimizada
clear all;
clc;

fprintf('Trabalho de Avalia��o Final de Inteligencia Computacional: \n\n');
fprintf('Nome:Igor Rodrigues Cardoso\nMatricula:0323478\nProfessor: Jarbas Joacir\n\n');
fprintf('O trabalho consiste de que acordo com a fun��o dada na quest�o, achar as suas posi��es X e Y e o valor de F(x,y) para cada posi��o por meio do algoritmo PSO(Enxame de Particulas)!\n\n');

var = 2;%quantidade de variaveis
funcao = inline('(1-x)^2 + 100*(y - x^2)^2','x','y');%Transformando string polinimial em uma fun��o x e y
funcao = vectorize(funcao)%vetoriza a funcao que ser� utilizada pelo usuario

%Parte I: Inicializa��o dos parametros de entrada

disp('Digite o tamanho da popula��o: ');
pop = input('');%Tamanho da popula��o

disp('Digite o tempo necessario para encontrar o minimo atraves da simula��o via PSO: ');
t = input('');

disp('Digite o peso minimo: ');
wmin = input('');

disp('Digite o peso maximo: ');
wmax= input('');

disp('Digite as taxas conigtivas,C1 e C2\n\n\n: ');
C1 = input('');
C2 = input('');

w = linspace(wmax,wmin,t);%Vetor de pesos com t itera��es!


%Limites parametrais 
%Para posi��o X
a(1:pop,1) = -2;
b(1:pop,1) = 2;
%Para Posi��o Y
a(1:pop,2) = -2;
b(1:pop,2) = 2;

m = a;
n = b;  
d = (b-a);
q = (n - m)/2;

%Parte II: Atribui��o de Valores randomicos
Posicao = a + d.*rand(pop,var);
Velocidade = q.*rand(pop,var);
%-------------------------------------------
f = funcao(Posicao(:,1),Posicao(:,2));%Fun��o recebe os valores de X e Y
[fgmelhor, igmelhor] = min(f);%Matriz com as melhores particulas e popula��o(Minimo de F)
melhorg = Posicao(igmelhor,:);
melhorp = Posicao;
melhorf= f;

%Atualiza��o das variaveis X e Y
for i = 1:t
    f = funcao(Posicao(:,1),Posicao(:,2));
    Velocidade(1:pop,1:var) = w(pop)*Velocidade(1:pop,1:var)+ C1*rand*(melhorp(1:pop,1:var) - Posicao(1:pop,1:var)) + C2*rand*(repmat(melhorg,pop,1)-Posicao(1:pop,1:var));
    Posicao(1:pop,1:var) = Posicao(1:pop,1:var) + Velocidade(1:pop,1:var);
    
    %Achar o melhorp e melhorg
    [minif, iminif] = min(f);
    if minif <= fgmelhor
        fgmelhor = minif;
        melhorg = Posicao(iminif,:);%melhor posi��o encontrada na popula��o
    end
    wpb = find(f <= melhorf);
    melhorp(wpb,:) = Posicao(wpb,:);%Melhor posi��o de X e Y
    melhorf(wpb) = f(wpb);%Melhor posicao de F(x,y), ou os valores de F(x,y)
    
end
fprintf('Valores x e y  F(x,y) encontradas: ')
[melhorp melhorf]%Melhores posi��es X e Y


