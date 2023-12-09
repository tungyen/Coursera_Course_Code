list = [0 0 0 15;-90 0 220 -40;0 430 -90 -50;-90 0 430 30;90 0 0 70;-90 0 0 25];
clc;
T01 = Transform_matrix(list(1,1), list(1,2), list(1,3), list(1,4));
T12 = Transform_matrix(list(2,1), list(2,2), list(2,3), list(2,4));
T23 = Transform_matrix(list(3,1), list(3,2), list(3,3), list(3,4));
T34 = Transform_matrix(list(4,1), list(4,2), list(4,3), list(4,4));
T45 = Transform_matrix(list(5,1), list(5,2), list(5,3), list(5,4));
T56 = Transform_matrix(list(6,1), list(6,2), list(6,3), list(6,4));
T04 = T01*T12*T23*T34
T06 = T04*T45*T56


