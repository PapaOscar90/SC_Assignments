function [times, positions, velocities] = simulate2(masses, initial_positions, initial_velocities, duration)
%simulate2 Simulation of the two-body problem.
%  masses              A 2-vector containing the masses of the two bodies.
%  initial_positions   A 3-by-2 matrix containing the initial positions.
%  initial_velocities  A 3-by-2 matrix containing the initial velocities.
%  duration            The desired total duration of the simulation.
% Units: au, day, 10^24 kg

% Set step size and number of steps
Delta_t = 1
num_steps = 3650

% Create times array
times = (0:num_steps)' * Delta_t;

% Initialize array containing trajectories
positions = zeros(3,2,num_steps+1);
velocities = zeros(3,2,num_steps+1);
positions(:,:,1) = initial_positions; % positions before we begin (at step 0)
velocities(:,:,1) = initial_velocities; % velocities at step 0

% Simulate
for i=1:num_steps
    % Compute derivatives
    dxdt = % TODO
    dvdt = % TODO
    
    % Integrate
    positions(:,:,i+1) = % TODO
    velocities(:,:,i+1) = % TODO
end

end
