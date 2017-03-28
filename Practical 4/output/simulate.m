function [F, G] = simulate(s, beta, duration)
%simulate Simulates the reaction diffusion system

% Initialize F and G
F = 4*ones(size(beta));
G = 4*ones(size(beta));

imwrite(F/16,'F_step=0.png');
imwrite(G/16,'G_step=0.png');

% Set step size and number of steps
Delta_t = 0.25;
num_steps = duration/Delta_t;
    
% Evolve F and G
for i=1:num_steps
    [dFdt, dGdt] = reactionDiffusionD(F, G, s, beta);
    F = F + Delta_t.*dFdt;
    G = G + Delta_t.*dGdt;
    G = max(G, 0);
    if i == 500 || i == 5000 || i == num_steps
        imwrite(F/16,['F_step=',int2str(i),'.png']);
        imwrite(G/16,['G_step=',int2str(i),'.png']);
    end
end
