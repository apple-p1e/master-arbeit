function g = sigmoidGradient(c, z)
% Return the gradient of the sigmoid function evaluated at z.
% Usage: g = sigmoidGradient(z)

    g = 1.0 ./ (1.0 + exp(-z));
    g = g - g.^2;
end
