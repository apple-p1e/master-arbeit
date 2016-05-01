function g = sigmoid(c, z)
% Compute sigmoid function.
% Usage: g = sigmoid(z)

    g = 1.0 ./ (1.0 + exp(-z));
end
