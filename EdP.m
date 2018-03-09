%Nome: Igor Rodrigues Cardoso 
%Matricula: 0323478
%Trabalho de Avalia��o Final de Intelig�ncia Computacional
%Prof: Jarbas Joacir


%Utiliza��o do PSO(Ou Enxame de particulas) para calcular o minimos de
%fun��es polinomiais utilizando a seguinte fun��o: 
%F(x,y) =(1-x�)+100(y - x�)�


function [minimo, X , Y, Fxy]  = EdP(F, Fm, erro, n, pop, cpa, cpop, t)%EdP = Enxame de Particulas


%Parametros de Entrada
%F = Fun��o que ser� digitada pelo usu�rio.
%Fm = Maior resultado esperado da fun��o
%erro = taxa de erro
%n = numero de particulas
%pop = numero de popula��es
%cpa = porcetagens de informa��o que � absorvida pelas particulas
%cpop = porcentagens de informa��o que � absorvida pela popula��o
%t = Quantidade de tempo de uma determinada situa��o

%Parametros de Saida
%minimo = O minimo da fun��o
%Xfinal = Valores de x
%Yfinal = Valores de y
%Fxy = Valores adquiridos pela fun��o


%Enfim, primeira parte, aleatoriamente colocamos as posi��es, x e y e suas
%respectivas velocidades

syms x;
syms y;
%Melhor resultado para fun��o fun��o


%Posicoes de X,Y
x1 = 10*rand(n,[1,t]);
y1 = 10*rand(n,[1,t]);

%Velocidades de X e Y
Vx = 10*rand(n,[1,t]);
Vy = 10*rand(n,[1,t]);



%Primeira parte, esse la�o servira pra escolher quais ser�o os valores minimos de cada posi��o de cada popula��o 
for i = 1:n        
    Freal(1,i) = subs(F,{x,y},{x1(1,i),y1(1,i)});%atribuindo os valores gerados � fun��o digitada pelo usuario
    px(1,i) = x(1,i);%
    py(1,i) = y(1,i);
    if Freal(1,i) < Fm
        gx(1,i) = x1(1,i);
        gy(1,i) = y1(1,i);
    end
end


%segunda parte: Atualiza��o das velocidades e posi��es
it= 1 %primeira itera��o
while erro > 0.01
    if it > 100;
        erro = 0;
    else
        for i = 1:t
            
        
        end
    end
end
end

