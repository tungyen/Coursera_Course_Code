clc;clear;
T_WD = [1 0 0 830;0 1 0 20;0 0 1 330;0 0 0 1];
T_DC = [0.5 0 -sind(60) -500;0 1 0 452;sind(60) 0 0.5 410;0 0 0 1];
T_W0 = [1 0 0 0;0 1 0 0;0 0 1 373;0 0 0 1];
T_6C = [0 0 1 0;0 -1 0 0;1 0 0 206;0 0 0 1];
T_WC = T_WD*T_DC;
T_06 = inv(T_W0)*T_WC*inv(T_6C);
syms theta3 u theta2 theta1
u_sin = (2*u)/(u^2 + 1);
u_cos = (1-u^2)/(1+u^2);
r = (T_06(1,4)^2) + (T_06(2,4)^2) + (T_06(3,4)^2);
x = T_06(1,4);
z = T_06(3,4);
k1 = 340-338*sind(theta3)-40*cosd(theta3);
k2 = 40*sind(theta3)-338*cosd(theta3);
k3 = (k1^2) + (k2^2) + 900;
g1 = 340*cosd(theta2)-338*sind(theta2+theta3)-40*cosd(theta2+theta3)-30;
eqn_3_tmp = ((r-k3)^2)/3600 + z^2 ==k1^2 + k2^2;
eqn_theta3 = subs(eqn_3_tmp, {sind(theta3), cosd(theta3)}, {u_sin, u_cos});
angle_3 = vpa(solve(eqn_theta3, u));
%theta3 答案
theta3_ans = vpa(2*atand(angle_3));


eqn_2_tmp = k3-60*(k1*cosd(theta2) + k2*sind(theta2)) == r;
matrix_2 = [];
for i = 1:4
    eqn_theta2 = subs(eqn_2_tmp, {theta3, sind(theta2), cosd(theta2)}, {theta3_ans(i), u_sin, u_cos});
    angle_2 = vpa(solve(eqn_theta2,u));
    %theta2 答案
    theta2_ans = vpa(2*atand(angle_2));
    matrix_2 = [matrix_2 theta2_ans];
end


eqn_1_tmp = cosd(theta1)*g1 == x;
matrix_1 = [];
for j = 1:4
    for k = 1:2
        eqn_theta1 = subs(eqn_1_tmp, {theta3, theta2, cosd(theta1)}, {theta3_ans(j), matrix_2(k,j), u_cos});
        angle_1 = vpa(solve(eqn_theta1,u));
        %theta1 答案
        theta1_ans = vpa(2*atand(angle_1));
        matrix_1 = [matrix_1 theta1_ans];
    end
end

%找theta1~3合理解
total = [];
for arg3 = 2:3
    for arg2 = 1:2
        for arg1 = 1:2
            tmp = [theta3_ans(arg3) matrix_2(arg2, arg3) matrix_1(arg1,(arg3-1)*2+1)];
            total = [total;tmp];
        end
    end
end

R06 = [-0.866 0 0.5;0 -1 0;0.5 0 0.866];
total456 = [];
for count = 1:8
    R01 = R_matrix(total(count,3),0);
    R12 = R_matrix(total(count,2),-90);
    R23 = R_matrix(total(count,1),0);
    R03 = R01*R12*R23;
    RX = [1 0 0;0 0 1;0 -1 0];
    R36 = inv(R03*RX)*R06;
    beta1 = vpa(atan2(sqrt(R36(3,1)^2+R36(3,2)^2),R36(3,3))*180/pi);
    beta2 = -beta1;
    alpha1 = vpa(atan2(R36(2,3)/sind(beta1),R36(1,3)/sind(beta1))*180/pi)+180;
    alpha2 = vpa(atan2(R36(2,3)/sind(beta2),R36(1,3)/sind(beta2))*180/pi)+180;
    garmma1 = vpa(atan2(R36(3,2)/sind(beta1),-R36(3,1)/sind(beta1))*180/pi)+180;
    garmma2 = vpa(atan2(R36(3,2)/sind(beta2),-R36(3,1)/sind(beta2))*180/pi)+180;
    theta456 = Calculate_up_pi(beta1, beta2, alpha1, alpha2, garmma1, garmma2);
    total456 = [total456;theta456];
end

total = [total total456];
total_num = double(total);


