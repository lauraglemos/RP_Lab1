

% Define filled cells
{ fill(X,Y) } :- thermometer(X,Y,O).


% Up-bulb (U): flow is from (X,Y) to (X-1,Y)
:- thermometer(X,Y,u_head), not fill(X,Y), fill(X-1,Y), X > 0.

% Down-bulb (D): flow is from (X,Y) to (X+1,Y)
:- thermometer(X,Y,d_head), not fill(X,Y), fill(X+1,Y), X < n-1.

% Left-bulb (L): flow is from (X,Y) to (X,Y-1)
:- thermometer(X,Y,l_head), not fill(X,Y), fill(X,Y-1), Y > 0.

% Right-bulb (R): flow is from (X,Y) to (X,Y+1)
:- thermometer(X,Y,r_head), not fill(X,Y), fill(X,Y+1), Y < n-1.


% Body right (>)
:- thermometer(X,Y,r_body), fill(X,Y), not fill(X, Y-1), Y > 0.

% Body up (^)
:- thermometer(X,Y,u_body), fill(X,Y), not fill(X+1, Y), X < n-1.

% Body left (<)
:- thermometer(X,Y,l_body), fill(X,Y), not fill(X, Y+1), Y < n-1.

% Body down (v)
:- thermometer(X,Y,d_body), fill(X,Y), not fill(X-1, Y), X > 0.

%
% L TURNS
%

% If the corner is filled, at least ONE of the neighbors must be filled.

% └ turn (tr_turn)
:- thermometer(X,Y,tr_turn), fill(X,Y), not fill(X-1,Y), not fill(X,Y+1), X > 0, Y < n-1.

% ┐ turn (bl_turn)
:- thermometer(X,Y,bl_turn), fill(X,Y), not fill(X+1,Y), not fill(X,Y-1), X < n-1, Y > 0.

% ┌ turn (br_turn)
:- thermometer(X,Y,br_turn), fill(X,Y), not fill(X+1,Y), not fill(X,Y+1), X < n-1, Y < n-1.

% ┘ turn (tl_turn)
:- thermometer(X,Y,tl_turn), fill(X,Y), not fill(X-1,Y), not fill(X,Y-1), X > 0, Y > 0.




% Number of filled columns should match the column constraints
 :- col(Y,C), C != #count { X : fill(X,Y) }.

% Number of filled rows should match the row constraints
 :- row(X,C), C != #count { Y : fill(X,Y) }.

% ======================
% REACHABILITY RULES
% ======================

% Los bulbos llenos son alcanzables por sí mismos
reachable(X,Y) :- thermometer(X,Y,r_head), fill(X,Y).
reachable(X,Y) :- thermometer(X,Y,l_head), fill(X,Y).
reachable(X,Y) :- thermometer(X,Y,u_head), fill(X,Y).
reachable(X,Y) :- thermometer(X,Y,d_head), fill(X,Y).

% Body pieces son alcanzables desde su predecesor
reachable(X,Y) :- thermometer(X,Y,r_body), fill(X,Y), reachable(X,Y-1), fill(X,Y-1), Y > 0.
reachable(X,Y) :- thermometer(X,Y,u_body), fill(X,Y), reachable(X+1,Y), fill(X+1,Y), X < n-1.
reachable(X,Y) :- thermometer(X,Y,l_body), fill(X,Y), reachable(X,Y+1), fill(X,Y+1), Y < n-1.
reachable(X,Y) :- thermometer(X,Y,d_body), fill(X,Y), reachable(X-1,Y), fill(X-1,Y), X > 0.

% Turns son alcanzables desde cualquiera de sus dos direcciones conectadas
% tr_turn └: conecta arriba y derecha
reachable(X,Y) :- thermometer(X,Y,tr_turn), fill(X,Y), reachable(X-1,Y), fill(X-1,Y), X > 0.
reachable(X,Y) :- thermometer(X,Y,tr_turn), fill(X,Y), reachable(X,Y+1), fill(X,Y+1), Y < n-1.

% bl_turn ┐: conecta abajo e izquierda
reachable(X,Y) :- thermometer(X,Y,bl_turn), fill(X,Y), reachable(X+1,Y), fill(X+1,Y), X < n-1.
reachable(X,Y) :- thermometer(X,Y,bl_turn), fill(X,Y), reachable(X,Y-1), fill(X,Y-1), Y > 0.

% br_turn ┌: conecta abajo y derecha
reachable(X,Y) :- thermometer(X,Y,br_turn), fill(X,Y), reachable(X+1,Y), fill(X+1,Y), X < n-1.
reachable(X,Y) :- thermometer(X,Y,br_turn), fill(X,Y), reachable(X,Y+1), fill(X,Y+1), Y < n-1.

% tl_turn ┘: conecta arriba e izquierda
reachable(X,Y) :- thermometer(X,Y,tl_turn), fill(X,Y), reachable(X-1,Y), fill(X-1,Y), X > 0.
reachable(X,Y) :- thermometer(X,Y,tl_turn), fill(X,Y), reachable(X,Y-1), fill(X,Y-1), Y > 0.

% RESTRICCIÓN CLAVE: toda celda llena debe ser alcanzable desde un bulbo
:- fill(X,Y), not reachable(X,Y).

#show .
#show fill/2.







