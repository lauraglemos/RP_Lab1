% n chega como parámetro

%hai que cambiar pola bola

% #const n=4.
% cell(1..n,1..n).

% vamos a tener que contar las letras del txt para saber cuantos termometros hay.
% k tb se tendría que meter como variables.
% k {thermo(X,Y) : cell(X,Y)} k.

% definimos cada termómetro -> (bola{1,0}, orientacion{R,U,L,D},longitud{2,n})

% Define filled cells
m {filled(X,Y) : cell(X, Y)} m.


% Rules and constraints
is_head(X,Y) :- thermometer(X,Y,O), O = r; O = u; O = l; O = d.
is_body(X,Y) :- thermometer(X,Y,O), O = r_body; O = u_body; O = l_body; O = d_body.

% Head must be filled if the next cell in the direction is filled
:- is_head(X,Y), thermometer(X,Y,O), O = r, not filled(X,Y), filled(X+1, Y).
:- is_head(X,Y), thermometer(X,Y,O), O = u, not filled(X,Y), filled(X, Y+1).
:- is_head(X,Y), thermometer(X,Y,O), O = l, not filled(X,Y), filled(X-1, Y).
:- is_head(X,Y), thermometer(X,Y,O), O = d, not filled(X,Y), filled(X, Y-1).

% Body can be filled if the previous cell is filled
:- is_body(X,Y), thermometer(X,Y,r_body), filled(X,Y), X > 0, not filled(X-1,Y).
:- is_body(X,Y), thermometer(X,Y,u_body), filled(X,Y), Y < n+1, not filled(X,Y+1).
:- is_body(X,Y), thermometer(X,Y,l_body), filled(X,Y), X < n+1, not filled(X+1,Y).
:- is_body(X,Y), thermometer(X,Y,d_body), filled(X,Y), Y > 0, not filled(X,Y-1).
% Number of filled columns should match the col constraints
:- col(Y,C), C != #count { X : filled(X,Y) }.

% Number of filled rows should match the row constraints
:- row(X,C), C != #count { Y : filled(X,Y) }.

#show .
#show filled/2.

% longitude(1..n).
% head(0;1).
% orientation(R;U;L;D)


