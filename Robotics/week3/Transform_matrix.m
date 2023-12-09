function T_matrix = Transform_matrix(alpha, a, d, theta)
    T_matrix = zeros(4);
    T_matrix(1,1) = cosd(theta);
    T_matrix(1,2) = -sind(theta);
    T_matrix(1,4) = a;
    T_matrix(2,1) = sind(theta)*cosd(alpha);
    T_matrix(2,2) = cosd(theta)*cosd(alpha);
    T_matrix(2,3) = -sind(alpha);
    T_matrix(2,4) = -sind(alpha)*d;
    T_matrix(3,1) = sind(theta)*sind(alpha);
    T_matrix(3,2) = cosd(theta)*sind(alpha);
    T_matrix(3,3) = cosd(alpha);
    T_matrix(3,4) = cosd(alpha)*d;
    T_matrix(4,4) = 1;
end
