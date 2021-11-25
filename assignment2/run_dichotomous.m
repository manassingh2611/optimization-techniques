clc;

cost = @(x) x^3;
% cost = @(x) 3*((x - 4)^2) + 5*(x - 4) + (x - 4) / 2 + 6 * (x - 4) + 20;
l = input("Enter the interval of uncertainty in the format [a, b]\n");
if (l(1) > l(2))
    error("Illegal interval!!!\n");
end
n = input("Enter the number of iterations (default=250)");

fprintf("The optimal cost of semiconductor is Rs %.6f /-.", dichotomous(cost, l(1), l(2), n));



