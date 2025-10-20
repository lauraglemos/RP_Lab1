#const n = 4. % Board size (will be passed as parameter)
#const m = 7. % Number of filled cells (will be passed as parameter)
#const k = 7. % Number of thermometers (will be passed as parameter)

% Board size n x n
cell(1..n, 1..n).

% Define filled cells
m {filled(X,Y) : cell(X, Y)} m.

orientation(R;U;L;D).

k {thermometer(X,Y,O) : cell(X,Y), orientation(O)} k.

% Define column and row numbers (this will be created automatically)
col(1, 3). col(2, 2). col(3, 1). col(4, 1).
row(1, 1). row(2, 3). row(3, 2). row(4, 1).

% Thermometer facts (this will be created automatically)
thermometer(1,1, R).
thermometer(2,1, U). thermometer(2,2,R). thermometer(2,4,D).
thermometer(3,1,D). thermometer(3,2,D). thermometer(3,3,D).

