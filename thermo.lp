% n chega como parámetro

%hai que cambiar pola bola

% #const n=4.
% cell(1..n,1..n).

% vamos a tener que contar las letras del txt para saber cuantos termometros hay.
% k tb se tendría que meter como variables.
% k {thermo(X,Y) : cell(X,Y)} k.

% definimos cada termómetro -> (bola{1,0}, orientacion{R,U,L,D},longitud{2,n})

% Rules and constraints
is_head(X,Y) :- thermometer(X,Y,O), O = R; O = U; O = L; O = D.
is_body(X,Y) :- thermometer(X,Y,O), O = r; O = u; O = l; O = d.

% Head can always be filled

% Body can be filled if the previous cell is filled

% Filled columns should match the col constraints

% Filled rows should match the row constraints

% longitude(1..n).
% head(0;1).
% orientation(R;U;L;D)


