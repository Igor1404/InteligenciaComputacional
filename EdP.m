%Nome: Igor Rodrigues Cardoso 
%Matricula: 0323478
%Trabalho de Avaliação Final de Inteligência Computacional
%Prof: Jarbas Joacir


%Utilização do PSO(Ou Enxame de particulas) para calcular o minimos de
%funções polinomiais utilizando a seguinte função: 
%F(x,y) =(1-x²)+100(y - x²)²


function [minimo, X , Y, Fxy]  = EdP(F, Fm, erro, n, pop, cpa, cpop, t)%EdP = Enxame de Particulas


%Parametros de Entrada
%F = Função que será digitada pelo usuário.
%Fm = Maior resultado esperado da função
%erro = taxa de erro
%n = numero de particulas
%pop = numero de populações
%cpa = porcetagens de informação que é absorvida pelas particulas
%cpop = porcentagens de informação que é absorvida pela população
%t = Quantidade de tempo de uma determinada situação

%Parametros de Saida
%minimo = O minimo da função
%Xfinal = Valores de x
%Yfinal = Valores de y
%Fxy = Valores adquiridos pela função


%Enfim, primeira parte, aleatoriamente colocamos as posições, x e y e suas
%respectivas velocidades

syms x;
syms y;
%Melhor resultado para função função


%Posicoes de X,Y
x1 = 10*rand(n,[1,t]);
y1 = 10*rand(n,[1,t]);

%Velocidades de X e Y
Vx = 10*rand(n,[1,t]);
Vy = 10*rand(n,[1,t]);



%Primeira parte, esse laço servira pra escolher quais serão os valores minimos de cada posição de cada população 
for i = 1:n        
    Freal(1,i) = subs(F,{x,y},{x1(1,i),y1(1,i)});%atribuindo os valores gerados à função digitada pelo usuario
    px(1,i) = x(1,i);%
    py(1,i) = y(1,i);
    if Freal(1,i) < Fm
        gx(1,i) = x1(1,i);
        gy(1,i) = y1(1,i);
    end
end


%segunda parte: Atualização das velocidades e posições
it= 1 %primeira iteração
while erro > 0.01
    if it > 100;
        erro = 0;
    else
        for i = 1:t
            
        
        end
    end
end
end

