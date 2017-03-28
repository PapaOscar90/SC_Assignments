beta = 0.1.*randn(100,100) + 12;
imwrite(beta/16, 'beta.png');
s = 1;
duration = 10000;
simulate(s, beta, duration);