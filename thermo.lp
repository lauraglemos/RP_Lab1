

% Define filled cells
{ fill(X,Y) } :- thermometer(X,Y,O).

:- fill(X,Y), not thermometer(X,Y,_).

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

#show .
#show fill/2.



