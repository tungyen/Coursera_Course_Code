clc;clear;
R03 = [0.6006 0.7082 -0.3710;0.24 0.283 0.9286;0.7627 -0.6468 0];
RX = [1 0 0;0 0 1;0 -1 0];
R06 = [0 0.5736 0.8192;0 -0.8192 0.5736;1 0 0];
R36 = inv(R03*RX)*R06;
beta = -vpa(atan2(sqrt(R36(3,1)^2+R36(3,2)^2),R36(3,3))*180/pi);
alpha = vpa(atan2(R36(2,3)/sind(beta),R36(1,3)/sind(beta))*180/pi)+180;
garmma = vpa(atan2(R36(3,2)/sind(beta),-R36(3,1)/sind(beta))*180/pi)+180;