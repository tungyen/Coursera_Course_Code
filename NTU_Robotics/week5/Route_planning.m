clc;clear;
dt1 = 2;dt2 = 2;dt3 = 5;
time = Route_matrix(dt1,dt2,dt3);
X = [-4;-5;-5;2;2;2;0;0;0;0;0;0];
Y = [0;5;5;3;3;-3;0;0;0;0;0;0];
Theta = [120;45;45;30;30;0;0;0;0;0;0;0];
total = [X Y Theta];
poly_matrix = inv(time)*total;
Theta1 = [pi-atan(0.75);0.75*pi-acos(66/(50*sqrt(2)));0.75*pi-acos(66/(50*sqrt(2)));
    atan(1.5)-acos(2.9/sqrt(13));atan(1.5)-acos(2.9/sqrt(13));-atan(1.5)-acos(2.9/sqrt(13));0;0;0;0;0;0];
Theta2 = [pi-atan(4/3);pi-acos(-16/30);pi-acos(-16/30);pi-acos(21/30);pi-acos(21/30);pi-acos(21/30);0;0;0;0;0;0];
Theta3 = [-5*pi/6;-pi/2-acos(34/(30*sqrt(2)));-pi/2-acos(34/(30*sqrt(2)));pi/6-atan(1.5)-acos(-1/(2*sqrt(13)));
    pi/6-atan(1.5)-acos(-1/(2*sqrt(13)));pi/2-atan(2/3)-acos(-1/(2*sqrt(13)));0;0;0;0;0;0];
joint = [Theta1 Theta2 Theta3];
poly_joint = inv(time)*joint;