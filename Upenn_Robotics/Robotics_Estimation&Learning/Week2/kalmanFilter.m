function [ predictx, predicty, state, param ] = kalmanFilter( t, x, y, state, param, previous_t )
%UNTITLED Summary of this function goes here
%   Four dimensional state: position_x, position_y, velocity_x, velocity_y

    %% Place parameters like covarainces, etc. here:
    % P = eye(4)
    % R = eye(2)

    % Check if the first time running this function
    if previous_t<0
        state = [x, y, 0, 0];
        param.P = 0.1 * eye(4);
        predictx = x;
        predicty = y;
        return;
    end

    %% TODO: Add Kalman filter updates
    % As an example, here is a Naive estimate without a Kalman filter
    % You should replace this code
    dt = t - previous_t;
    A = eye(4);
    A(1,3) = dt;
    A(2,4) = dt;
    C = [1 0 0 0;0 1 0 0];
    M = eye(4) * 1e3;
    O = eye(2) * 0.01;
    P = A*param.P*A' + M;
    R = O;
    K = P*C'*(R + C*P*C')^(-1);
    state = A*state' + K*([x;y] - C*A*state');
    param.P = P - K*C*P;
    % Predict 330ms into the future
    predictx = state(1) + state(3) * 0.330;
    predicty = state(2) + state(4) * 0.330;
    % State is a four dimensional element
    state = state';
end
