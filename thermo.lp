% n chega como parámetro

%hai que cambiar pola bola

% #const n=4.
% cell(1..n,1..n).

% vamos a tener que contar las letras del txt para saber cuantos termometros hay.
% k tb se tendría que meter como variables.
% k {thermo(X,Y) : cell(X,Y)} k.

% definimos cada termómetro -> (bola{1,0}, orientacion{R,U,L,D},longitud{2,n})

% Define filled cells
{ fill(X,Y) } :- thermometer(X,Y,O).

:- fill(X,Y), not thermometer(X,Y,_).


% Cuerpo 'derecha' (>) en (X,Y) -> requiere (X, Y-1)
:- thermometer(X,Y,r_body), fill(X,Y), not fill(X, Y-1), Y > 0.

% Cuerpo 'arriba' (^) en (X,Y) -> requiere (X+1, Y)
:- thermometer(X,Y,u_body), fill(X,Y), not fill(X+1, Y), X < n-1.

% Cuerpo 'izquierda' (<) en (X,Y) -> requiere (X, Y+1)
:- thermometer(X,Y,l_body), fill(X,Y), not fill(X, Y+1), Y < n-1.

% Cuerpo 'abajo' (v) en (X,Y) -> requiere (X-1, Y)
:- thermometer(X,Y,d_body), fill(X,Y), not fill(X-1, Y), X > 0.


 :- col(Y,C), C != #count { X : fill(X,Y) }.
% C { fill(X,Y) : row(X,_) } C :- col(Y,C).


% Number of filled rows should match the row constraints
 :- row(X,C), C != #count { Y : fill(X,Y) }.
% R { fill(X,Y) : col(Y,_) } R :- row(X,R).

#show .
#show fill/2.

% longitude(1..n).
% head(0;1).
% orientation(R;U;L;D)


