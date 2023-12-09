function [endeff] = computeMiniForwardKinematics(rads1,rads2)
alpha = 0.5*(rads1+rads2) + pi;
beta = (rads1-rads2)*0.5;
l = sqrt((cos(beta)^2)+3) - cos(beta);
endeff = [l*cos(alpha),l*sin(alpha)];