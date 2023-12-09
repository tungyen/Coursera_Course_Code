clc;clear;
syms s
X = ((exp(s*5)-exp(s))/(s*5))^2;
X1 = diff(X);
X2 = diff(X1);
U = vpa(limit(X1,s,0));
VAR = (vpa(limit(X2,s,0))-U^2);