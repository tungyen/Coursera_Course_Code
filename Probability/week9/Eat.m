clc;clear;
syms W(s)
W(s) = (exp(12*(exp(s)-1))-exp(6*(exp(s)-1)))/(3*(1-exp(2*(-exp(s)+1))));
W2 = diff(W,s);
W3 = diff(W2,s);
U = vpa(limit(W2,s,0));
VAR = vpa(limit(W3,s,0)) - U^2;