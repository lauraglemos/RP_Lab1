#const n = 4.
#const m = 7.
#const k = 7.
dim(4).
cell(0,0).
cell(0,1).
cell(0,2).
cell(0,3).
cell(1,0).
cell(1,1).
cell(1,2).
cell(1,3).
cell(2,0).
cell(2,1).
cell(2,2).
cell(2,3).
cell(3,0).
cell(3,1).
cell(3,2).
cell(3,3).
orientation(r;u;l;d;r_body;u_body;l_body;d_body).
thermometer(0, 0, u_body).
thermometer(0, 1, r).
thermometer(0, 2, r_body).
thermometer(0, 3, r_body).
thermometer(1, 0, u).
thermometer(1, 1, r).
thermometer(1, 2, r_body).
thermometer(1, 3, d).
thermometer(2, 0, d).
thermometer(2, 1, d).
thermometer(2, 2, d).
thermometer(2, 3, d_body).
thermometer(3, 0, d_body).
thermometer(3, 1, d_body).
thermometer(3, 2, d_body).
thermometer(3, 3, d_body).
col(0, 3).
col(1, 2).
col(2, 1).
col(3, 1).
row(0, 1).
row(1, 3).
row(2, 2).
row(3, 1).
