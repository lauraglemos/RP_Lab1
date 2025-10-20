#const n = 4.
#const m = 7.
#const k = 7.
cell(1,1).
cell(1,2).
cell(1,3).
cell(1,4).
cell(2,1).
cell(2,2).
cell(2,3).
cell(2,4).
cell(3,1).
cell(3,2).
cell(3,3).
cell(3,4).
cell(4,1).
cell(4,2).
cell(4,3).
cell(4,4).
orientation(r;u;l;d;r_body;u_body;l_body;d_body).
thermometer(1, 1, u_body).
thermometer(1, 2, r).
thermometer(1, 3, r_body).
thermometer(1, 4, r_body).
thermometer(2, 1, u).
thermometer(2, 2, r).
thermometer(2, 3, r_body).
thermometer(2, 4, d).
thermometer(3, 1, d).
thermometer(3, 2, d).
thermometer(3, 3, d).
thermometer(3, 4, d_body).
thermometer(4, 1, d_body).
thermometer(4, 2, d_body).
thermometer(4, 3, d_body).
thermometer(4, 4, d_body).
col(1, 3).
col(2, 2).
col(3, 1).
col(4, 1).
row(1, 1).
row(2, 3).
row(3, 2).
row(4, 1).
