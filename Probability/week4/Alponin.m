clc;clear;
u = 25.5622;
p = 1/u;
length = 400;

%中零槍
P0 = (1-p)^100;

%中一槍
P1 = 0;
for t1 = 1:100
    tmp = (1-p)^(t1-1)*p*(1-p)^((length-4*t1)/2);
    P1 = P1 + tmp;
end


%中兩槍
P2 = 0;
for t1 = 1:99
    rest_time = (400-4*t1)/2;
    for t2 = 1:rest_time
        tmp = (1-p)^(t1-1)*p*(1-p)^(t2-1)*p*(1-p)^(length-4*t1-2*t2);
        P2 = P2 + tmp;
    end
end


%中三槍
P3 = 0;
for t1 = 1:99
    rest_time = ((length-4*t1)/2);
    for t2 = 1:rest_time
        rest_time2 = (length-4*t1-2*t2);
        for t3 = 1:rest_time2
            tmp = (1-p)^(t1-1)*p*(1-p)^(t2-1)*p*(1-p)^(t3-1)*p*(1-p)^((length-4*t1-2*t2-t3)/0.5);
            P3 = P3 + tmp;
        end
    end
end

P = P0 + P1 + P2 + P3;

