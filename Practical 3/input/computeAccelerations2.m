function [ dvdt ] = computeAccelerations2(masses, positions)
%computeAccelerations2 Compute the accelerations of two bodies based on Newtonian gravitation.
%  masses      A 2-vector containing the masses of the two bodies.
%  positions   A 3-by-2 matrix containing the initial positions.
% Units: au, day, 10^24 kg

% The gravitational constant in the appropriate units (au^3/(10^24 kg day^2)).
G = 1.48814e-10;

% Initialize accelerations
dvdt = zeros(3,2);

% Compute accelerations
dvdt(:,1) = % TODO
dvdt(:,2) = % TODO

end
