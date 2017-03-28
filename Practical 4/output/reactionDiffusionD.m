function [dFdt, dGdt] = reactionDiffusionD(F, G, s, beta)
%reactionDiffusionD Computes time derivative of the reaction diffusion system

Df = 1/4;
Dg = 1/16;

% Compute the diffusion terms
Fright = circshift(F, 1, 1);
Fleft = circshift(F, -1, 1);
Fdown = circshift(F, 1, 2);
Fup = circshift(F, -1, 2);
dFdt = Df .* (Fright + Fleft + Fdown + Fup - 4 .* F);
Gright = circshift(G, 1, 1);
Gleft = circshift(G, -1, 1);
Gdown = circshift(G, 1, 2);
Gup = circshift(G, -1, 2);
dGdt = Dg .* (Gright + Gleft + Gdown + Gup - 4 .* G);

% Compute the reaction terms
dFdt = dFdt + (s/16).*(16 - F.*G);
dGdt = dGdt + (s/16).*(G > 0).*(F.*G - G - beta);

end
