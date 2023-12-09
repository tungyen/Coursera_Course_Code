function [rads1,rads2] = computeRrInverseKinematics(X,Y)

syms theta1 theta2 ;
c2 = ((X^2 + Y^2)-2)/2;
s2_1 = sqrt(1-c2^2);
s2_2 = -sqrt(1-c2^2);
rads2= acos(c2);
mat = [1+c2 -s2_1;1+c2 s2_1];
ini = [X;Y];
ans = inv(mat)*ini;
rads1=acos(ans(1));