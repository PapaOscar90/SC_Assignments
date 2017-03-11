function [F] = simulate1D(D, duration)
%Simulates the reaction diffusion system

% Initialize F with a centered impulse
F = zeros([1 101]);
F(51) = 1;

% Set step size and number of steps
Delta_t = % TODO
num_steps = % TODO

% Evolve F
for i=1:num_steps
    dFdt = % TODO: Fill in the derivative of F with respect to time.
    F = % TODO: Make sure F gets updated.
end

end
