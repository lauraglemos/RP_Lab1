% n chega como parámetro

%hai que cambiar pola bola

% #const n=4.
% cell(1..n,1..n).

% vamos a tener que contar las letras del txt para saber cuantos termometros hay.
% k tb se tendría que meter como variables.
% k {thermo(X,Y) : cell(X,Y)} k.

% definimos cada termómetro -> (bola{1,0}, orientacion{R,U,L,D},longitud{2,n})

% Define filled cells
{ filled(X,Y) } :- cell(X,Y).

% Cuerpo 'derecha' (>) en (X,Y) -> requiere (X, Y-1)
:- thermometer(X,Y,r_body), filled(X,Y), not filled(X, Y-1), Y > 1.

% Cuerpo 'arriba' (^) en (X,Y) -> requiere (X+1, Y)
:- thermometer(X,Y,u_body), filled(X,Y), not filled(X+1, Y), X < n.

% Cuerpo 'izquierda' (<) en (X,Y) -> requiere (X, Y+1)
:- thermometer(X,Y,l_body), filled(X,Y), not filled(X, Y+1), Y < n.

% Cuerpo 'abajo' (v) en (X,Y) -> requiere (X-1, Y)
:- thermometer(X,Y,d_body), filled(X,Y), not filled(X-1, Y), X > 1.
:- col(Y,C), C != #count { X : filled(X,Y) }.
% C { filled(X,Y) : row(X) } C :- col(Y,C).


% Number of filled rows should match the row constraints
:- row(X,C), C != #count { Y : filled(X,Y) }.
% R { filled(X,Y) : col(Y) } R :- row(X,R).

#show .
#show filled/2.

% longitude(1..n).
% head(0;1).
% orientation(R;U;L;D)


