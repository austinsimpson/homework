%Declare our symbolic variables
syms u h f(u, h)

%Define our f(u) function
f(u) = h*u - u^2;

%Create an expression for when f(u) is zero
rootExpression = f(u) == 0;

%Solves for the values that make rootExpression true.
zeros(h) = real(solve(rootExpression));

%Differentiate f(u) and plug in our zero values
dfdu(u, h) = diff(f(u), u);
slopeAtZeros(h) = dfdu(zeros(h), h);

%Sign of slope could tell us information about stabilitiy
signForSlope(h) = sign(slopeAtZeros(h));

interestingHValues = (-100:100);
zerosForHs = eval(subs(zeros, h, interestingHValues));
slopeSignsForHs = eval(subs(signForSlope, h, interestingHValues));

stableIndices = slopeSignsForHs <= 0;
unstableIndices = slopeSignsForHs >= 0;

stableBois = zerosForHs;
stableBois(~stableIndices) = NaN;

unstableBois = zerosForHs;
unstableBois(~unstableIndices) = NaN;

figure;
hold on;
xlabel('h')
ylabel('u')
plot(interestingHValues, stableBois, 'b')
plot(interestingHValues, unstableBois, 'r')
print('-dpng', 'problem8_bifurcation_curve.png')
hold off;

