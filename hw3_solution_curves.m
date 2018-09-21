syms R(t) t k a C
R(t) = k*(exp(C*exp(-a*t)))
R(t) = subs(R(t), {k a}, {1, 1})

interestingConstants = [1, 2, 4, 5, 7]

tsOfInterest = (0:0.001:10);

for constantIndex = 1:numel(interestingConstants)
    figure
    radiusSolutionOne = subs(R(t), {t C}, {tsOfInterest interestingConstants(constantIndex)});
    hold on;
    xlabel('t')
    ylabel('R(t)')
    plot(tsOfInterest, radiusSolutionOne)
    print(strcat('solution_curve_2_c', num2str(interestingConstants(constantIndex)), '.png'), '-dpng')
    hold off;
end

