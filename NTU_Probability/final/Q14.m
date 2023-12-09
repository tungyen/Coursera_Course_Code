clear;clc;
EX = 0;
EX2 = 0;
for win = 0:6
    p = 0;
    for i = win:6
        tmp = (((1/3)^i)/6)*C(i,win)*(2/3)^(6-i);
        p = p + tmp;
    end
    EX = EX + win*p;
    EX2 = EX2 + p*win^2;
end

VAR = EX2-EX^2;