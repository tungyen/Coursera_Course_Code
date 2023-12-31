function [ u1, u2 ] = controller(~, state, des_state, params)
%CONTROLLER  Controller for the planar quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [y; z], state.vel = [y_dot; z_dot], state.rot = [phi],
%   state.omega = [phi_dot]
%
%   des_state: The desired states are:
%   des_state.pos = [y; z], des_state.vel = [y_dot; z_dot], des_state.acc =
%   [y_ddot; z_ddot]
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls

m = params.mass;
Ixx = params.Ixx;
g = params.gravity;

Kpz = 50;
Kvz = 10;
Kpphi = 80;
Kvphi = 20;
Kpy = 50;
Kvy = 10;

% Current State
y = state.pos(1); z = state.pos(2);
y_dot = state.vel(1); z_dot = state.vel(2);
phi = state.rot; phi_dot = state.omega;

% Destination
y_des = des_state.pos(1); z_des = des_state.pos(2);
y_des_dot = des_state.vel(1); z_des_dot = des_state.vel(2);
y_des_ddot = des_state.acc(1); z_des_ddot = des_state.acc(2);

phi_c = -(y_des_ddot+Kvy*(y_des_dot-y_dot)+Kpy*(y_des-y))/g;
phi_c_dot = -(Kvy*(y_des_ddot+g*phi)+Kpy*(y_des_dot-y_dot))/g;
u1 = m*(g + z_des_ddot + Kvz*(z_des_dot-z_dot) + Kpz*(z_des-z));
u2 = Ixx*(Kvphi*(phi_c_dot-phi_dot)+Kpphi*(phi_c-phi));
% FILL IN YOUR CODE HERE

end

