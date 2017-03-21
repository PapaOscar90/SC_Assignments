function [ dvdt ] = computeAccelerations3(masses, positions)
%computeAccelerations2 Compute the accelerations of two bodies based on Newtonian gravitation.
%  masses      A 2-vector containing the masses of the two bodies.
%  positions   A 3-by-2 matrix containing the initial positions.
% Units: au, day, 10^24 kg

% The gravitational constant in the appropriate units (au^3/(10^24 kg day^2)).
G = 1.48814e-10;

% Initialize accelerations
dvdt = zeros(3,3);

% Compute accelerations
for i = 1:3
  sum = 0;
  for j = 1:3
    if i != j
      posDiff = positions(:,j) - positions(:,i);
      sum += G*masses(j)*(posDiff)/(norm(posDiff)^3);
    end
  end
  dvdt(:,i) = sum;
end

end
