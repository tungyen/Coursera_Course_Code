function R = R_matrix(theta, alpha)
    R = [cosd(theta) -sind(theta) 0;
        sind(theta)*cosd(alpha) cosd(theta)*cosd(alpha) -sind(alpha);
        sind(theta)*sind(alpha) cosd(theta)*sind(alpha) cosd(alpha)];
end