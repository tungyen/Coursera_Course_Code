function [F, M] = controller(t, state, des_state, params)
%CONTROLLER  Controller for the quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [x; y; z], state.vel = [x_dot; y_dot; z_dot],
%   state.rot = [phi; theta; psi], state.omega = [p; q; r]
%
%   des_state: The desired states are:
%   des_state.pos = [x; y; z], des_state.vel = [x_dot; y_dot; z_dot],
%   des_state.acc = [x_ddot; y_ddot; z_ddot], des_state.yaw,
%   des_state.yawdot
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls


% =================== Your code goes here ===================
m = params.mass;
g = params.gravity;
Kp = [500;500;500]; Kd = [20;20;20];
r_des_ddot = des_state.acc + Kd.*(des_state.vel-state.vel) + Kp.*(des_state.pos-state.pos);
% Thrust
F = m*(g+r_des_ddot(3));

% Moment
M = zeros(3,1);
Kp_ang = [100;100;100];
Kd_ang = [2;2;2];
phi_des = (r_des_ddot(1)*sin(des_state.yaw)-r_des_ddot(2)*cos(des_state.yaw))/g;
theta_des = (r_des_ddot(1)*cos(des_state.yaw)+r_des_ddot(2)*sin(des_state.yaw))/g;
rot_des = [phi_des;theta_des;des_state.yaw];
omega_des = [0;0;des_state.yawdot];
M = Kp_ang.*(rot_des-state.rot) + Kd_ang.*(omega_des-state.omega);
if F>params.maxF
    F=params.maxF;
end
% =================== Your code ends here ===================

end
