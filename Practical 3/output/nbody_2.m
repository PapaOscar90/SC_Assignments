[times, positions, velocities] = simulate2sym([1.988544e6 5.97219],[0 0 0; 0.983236 0 0]',[0 0 0; 0 0.0174939 0]',10);
sunPositions   = squeeze(positions(1:2,1,:))';
earthPositions = squeeze(positions(1:2,2,:))';
plot(earthPositions(:,1), earthPositions(:,2), 'Color', 'blue'); hold on;
plot(sunPositions(:,1), sunPositions(:,2), 'Color', 'red');
earthPeriods = detectOrbitalPeriods(times, squeeze(positions(:,2,:) - positions(:,1,:)))