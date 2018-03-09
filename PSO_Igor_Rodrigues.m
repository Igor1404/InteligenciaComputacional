%Trabalho de Avaliação Final de Inteligência Computacional
%Nome: Igor Rodrigues Cardoso
%Matricula: 0323478
%Prof: Jarbas Joacir


%Utilização do PSO(Ou Enxame de particulas) para calcular o minimos de
%funções polinomiais utilizando a seguinte função: 
%F(x,y) =(1-x²)+100(y - x²)²


%Função a ser minimizada
clear all;
clc;

fprintf('Trabalho de Avaliação Final de Inteligencia Computacional: \n\n');
fprintf('Nome:Igor Rodrigues Cardoso\nMatricula:0323478\nProfessor: Jarbas Joacir\n\n');
fprintf('O trabalho consiste de que acordo com a função dada na questão, achar as suas posições X e Y e o valor de F(x,y) para cada posição por meio do algoritmo PSO(Enxame de Particulas)!\n\n');

var = 2;%quantidade de variaveis
funcao = inline('(1-x)^2 + 100*(y - x^2)^2','x','y');%Transformando string polinimial em uma função x e y
funcao = vectorize(funcao)%vetoriza a funcao que será utilizada pelo usuario

%Parte I: Inicialização dos parametros de entrada

disp('Digite o tamanho da população: ');
pop = input('');%Tamanho da população

disp('Digite o tempo necessario para encontrar o minimo atraves da simulação via PSO: ');
t = input('');

disp('Digite o peso minimo: ');
wmin = input('');

disp('Digite o peso maximo: ');
wmax= input('');

disp('Digite as taxas conigtivas,C1 e C2\n\n\n: ');
C1 = input('');
C2 = input('');

w = linspace(wmax,wmin,t);%Vetor de pesos com t iterações!


%Limites parametrais 
%Para posição X
a(1:pop,1) = -2;
b(1:pop,1) = 2;
%Para Posição Y
a(1:pop,2) = -2;
b(1:pop,2) = 2;

m = a;
n = b;  
d = (b-a);
q = (n - m)/2;

%Parte II: Atribuição de Valores randomicos
Posicao = a + d.*rand(pop,var);
Velocidade = q.*rand(pop,var);
%-------------------------------------------
f = funcao(Posicao(:,1),Posicao(:,2));%Função recebe os valores de X e Y
[fgmelhor, igmelhor] = min(f);%Matriz com as melhores particulas e população(Minimo de F)
melhorg = Posicao(igmelhor,:);
melhorp = Posicao;
melhorf= f;

%Atualização das variaveis X e Y
for i = 1:t
    f = funcao(Posicao(:,1),Posicao(:,2));
    Velocidade(1:pop,1:var) = w(pop)*Velocidade(1:pop,1:var)+ C1*rand*(melhorp(1:pop,1:var) - Posicao(1:pop,1:var)) + C2*rand*(repmat(melhorg,pop,1)-Posicao(1:pop,1:var));
    Posicao(1:pop,1:var) = Posicao(1:pop,1:var) + Velocidade(1:pop,1:var);
    
    %Achar o melhorp e melhorg
    [minif, iminif] = min(f);
    if minif <= fgmelhor
        fgmelhor = minif;
        melhorg = Posicao(iminif,:);%melhor posição encontrada na população
    end
    wpb = find(f <= melhorf);
    melhorp(wpb,:) = Posicao(wpb,:);%Melhor posição de X e Y
    melhorf(wpb) = f(wpb);%Melhor posicao de F(x,y), ou os valores de F(x,y)
    
end
fprintf('Valores x e y  F(x,y) encontradas: ')
[melhorp melhorf]%Melhores posições X e Y


