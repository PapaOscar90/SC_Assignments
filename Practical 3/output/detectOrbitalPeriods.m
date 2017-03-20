function [periods] = detectOrbitalPeriods(times, positions)
%detectOrbitalPeriods Detects the periods between the closest alignments to the initial position.
%  times      An n-vector containing the times (in days) for each time step.
%  positions  A 3-by-n matrix containing the positions at different time steps.

% Make sure times is a column vector
times = reshape(times, length(times), 1);

% Find "raw" peaks in cosines between all positions and the initial position.
norms = repmat(sum(positions.^2, 1), size(positions,1),1);
cosines = (positions'./norms')*(positions(:,1)/norms(1));
[~, inds] = findpeaks(cosines, 'MinPeakHeight', 0.9);

% Construct helper vectors for finding the previous/next time and cosine
timesprev = [2*times(1)-times(2); times(1:end-1)];
timesnext = [times(2:end); 2*times(end)-times(end-1)];
cosinesprev = [cosines(2); cosines(1:end-1)];
cosinesnext = [cosines(2:end); 2*cosines(end)-cosines(end-1)];

% Compute differences
prevdt = times(inds) - timesprev(inds);
nextdt = timesnext(inds) - times(inds);
prevdc = cosines(inds) - cosinesprev(inds);
nextdc = cosinesnext(inds) - cosines(inds);

% Find offsets compared to raw peak times based on fitting a parabola
offsets = (nextdt.^2.*prevdc + prevdt.^2.*nextdc)./(2*(nextdt.*prevdc - prevdt.*nextdc));
peaktimes = times(inds) + offsets;

% Finally, the periods are found by subtracting subsequent peak times
periods = peaktimes(2:end) - peaktimes(1:end-1);

end