sunInitPos = [3.147660191030975E-03  4.463712231301772E-03 -1.510770451213557E-04]';
sunInitVel = [-3.435423169637667E-06  6.592210488278360E-06  7.479768278324041E-08]';
sunMass = 1.988544e6;

earthInitPos = [-9.929338321334039E-01 -1.211085425112658E-03 -1.481573973763570E-04]';
earthInitVel = [-1.916030855421702E-04 -1.726260762531527E-02  1.097048028166892E-06]';
earthMass = 5.97219;

moonInitPos = [-9.927474839463430E-01 -3.879446461467768E-03  6.146158827394666E-05]';
moonInitVel = [3.672335958693653E-04 -1.720651025590462E-02 -2.687206765467105E-05]';
moonMass = earthMass / 81.3005691;

initPositions = [sunInitPos earthInitPos moonInitPos];
initVelocities = [sunInitVel earthInitVel moonInitVel];
masses = [sunMass earthMass moonMass];

[times, positions, velocities] = simulate3sym(masses, initPositions, initVelocities, 10);
sunPositions   = squeeze(positions(1:2,1,:))';
earthPositions = squeeze(positions(1:2,2,:))';
moonPositions = squeeze(positions(1:2,3,:))';
subplot(2,1,1);
plot(earthPositions(:,1), earthPositions(:,2), 'Color', 'blue'); hold on;
plot(sunPositions(:,1), sunPositions(:,2), 'Color', 'red');
plot(moonPositions(:,1), moonPositions(:,2), 'Color', 'black');
subplot(2,1,2);
plot(moonPositions(:,1) - earthPositions(:,1), moonPositions(:,2) - earthPositions(:,2));
earthPeriods = detectOrbitalPeriods(times, squeeze(positions(:,2,:) - positions(:,1,:)))
moonPeriods = detectOrbitalPeriods(times, squeeze(positions(:,3,:) - positions(:,2,:)))