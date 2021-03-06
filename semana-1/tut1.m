% Script Matlab para o Tutorial 1
% Principais comandos em Matlab e Octave

clear     % Apaga vari�vels do "Workspace"
close all % Fecha todos os gr�ficos eventualmente abertos
clc       % Limpa janela de comando

a = 1;
b = 3;
who % Exibe vari�veis da �rea de trabalho

pause % Pausa execu��o do script; 
%tecle espa�o na janela de comando para continuar

help linspace % Obt�m ajuda sobre comando linspace

pause

% ---- Vetores e gr�ficos ----
x = linspace(0, 100, 1e4); % Cria um vetor de 0 a 100 com 10^4 elementos igualmente espa�ados
Nx = length(x);            % Comprove dimens�o do vetor x (10^4)
y = logspace(-5,2,1e4);    % Equivalente a 10.^linspace(-5,2,1e4)
Ny = length(y);            % Comprove dimens�o do vetor y (10^4)

pause

tic  % Inicia o rel�gio
for i=1:length(x)
    zn(i) = x(i) + y(i);
end
toc  % Exibe o tempo

tic  % Reinicia o rel�gio
z = x + y; % z = zn
toc % Exibe o tempo
% Observe a diferen�a de tempo
% Opera��es com vetores s�o muito mais r�pidas

pause

figure(1)  % Abre figura de n�mero 1 para plotagem
plot(x)    % Plota vari�vel x
plot(y)    % Plota vari�vel y. A vari�vel x continua plotada? (N�o)

pause

hold on  % Ret�m as curvas j� plotadas para que
         % n�o desapare�am ao plotar novas curvas
plot(x, 'r')          % Plota a vari�vel x em vermelho (red)
plot(z, 'k')          % Veja as outras cores com "help plot"
legend('y', 'x', 'z')

pause

figure(2)
titulo = 'Par�bola'; % titulo � uma vari�vel "string"
plot(x,x.^2)
xlabel('x')          % Define nome para os eixos x e y e o t�tulo da Figura
ylabel('x^2')
title(titulo)
grid                 % O que faz este comando?

pause

% ---- Salvar a figura 1 em figura1.pdf e figura1.png ----
figure(1)
print -dpdf 'figura1'
print -dpng 'figura1'

pause

figure(3)
plot3(x,y,x.*y)
grid

pause

figure(4)
subplot(2, 2, 1)
plot(x, 2*x, 'm--')
subplot(2, 2, 2)
plot(x, cos(0.5*x), 'k.')
subplot(2, 2, 3)
plot(x, 10.^(-x), 'rx')
subplot(2, 2, 4)
plot(x, ones(size(x)), 'o')

pause

% ---- Indexa��o ----
a = x(end/2:end); % Metade final do vetor x
b = x(1:5)        % Primeiros 5 elementos
c = find(x>99.96) % �ndices dos elementos maiores que 99,96
d = x(c)          % Elementos maiores que 99,96
e = x([3 8 10 4]) % Elementos com �ndice 3,8,10 e 4

pause

w  = ones(size(b))        % Vetor de uns
w  = w + b
ze = zeros(1, length(w))  % Vetor de zeros
w  = rand(1, length(w))   % Vetor de numeros aleat�rios uniformemente
                          % distribu�dos entre 0 e 1
w = randn(1, length(w))   % Vetor de n�meros aleat�rios com distribui��o
                          % normal (Gaussiana), m�dia 0 e vari�ncia 1
w(1:3) = []               % Apagamos os 3 primeiros elementos do vetor w

pause

clear

% ---- Matrizes ----
v = [1, 3, 5]
size(v)
w = [1, 3, 5]'
w = v'
size(w)

pause

A = w * v
size(A)

A(1, 2)
col2 = A(:,2)
size(col2)

pause

A * A
A.*A
A * inv(A)

pause

B = A^2
B = A.^2

pause

eye(5)      % Matriz identidade
randn(2, 3) % Matriz aleat�ria

pause

% ---- Concatena��o de Matrizes ----
B = [A zeros(size(A)); ones(size(A)) eye(size(A))]
B = [B B]

pause

% ---- Gr�ficos de superf�cie ----
x = -5:0.5:5;
y = -5:0.5:5;

[X, Y] = meshgrid(x, y);

figure(5)

surf(X, Y, X.^3 + Y.^2)

pause

% ---- Controle de fluxo ----
x = rand(10, 1)
aux = Inf;
for i = 1:length(x)
    if x(i) <= aux
        aux = x(i);
    elseif x(i) < 0
        disp(x(i))
    else
        disp(-x(i))
    end 
end

aux

% ---- Polinomios ----



