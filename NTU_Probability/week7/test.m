clc;clear;
func = @(x,x0) (abs(2-4*abs(x-x0)));
q = integral2(func,0,0.25,0,1);