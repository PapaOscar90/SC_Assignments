function [F, G] = simulate(s, beta, duration)
%simulate Simulates the reaction diffusion system

% Initialize F and G
F = 4*ones(size(beta));
G = 4*ones(size(beta));

% Set step size and number of steps
Delta_t = % TODO: Find a reasonable step size.
num_steps = % TODO
    
% Evolve F and G
% TODO

end
