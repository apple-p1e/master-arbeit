function [J grad] = nnCostFunction(c, nn_params, input_layer_size, ...
                                   hidden_layer_size, num_labels, ...
                                   X, y, lambda)
% Computes the cost and gradient of the neural network.
% Usage: [J grad] = nnCostFunction(nn_params, hidden_layer_size, num_labels, ...
% X, y, lambda)

    % Reshape nn_params back into the parameters Theta1 and Theta2, the weight
    % matrices for our 2 layer neural network
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                     hidden_layer_size, (input_layer_size + 1));

    Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                     num_labels, (hidden_layer_size + 1));

    m = size(X, 1);

    a1 = [ones(m, 1) X];
    z2 = a1 * Theta1';
    a2 = [ones(m, 1) sigmoid(c, z2)];
    z3 = a2 * Theta2';
    a3 = sigmoid(c, z3);

    y2 = zeros(m, num_labels);
    for i = 1:m,
        y2(i, y(i)) = 1;
    end

    J = -sum(sum((log(a3).*y2 + log(1 - a3).*(1-y2))))/m + ...
        lambda*(sum([Theta1(:, 2:(input_layer_size + 1)).^2](:)) + ...
        sum([Theta2(:, 2:(hidden_layer_size + 1)).^2](:)))/(2*m);

    b3 = a3 - y2;
    b2 = b3 * Theta2(:, 2:end) .* sigmoidGradient(c, z2);

    delta2 = b3' * a2;
    delta1 = b2' * a1;

    Theta2_reg = lambda*Theta2/m;
    Theta2_reg(:, 1) = 0;
    Theta1_reg = lambda*Theta1/m;
    Theta1_reg(:, 1) = 0;
    Theta2_grad = delta2/m + Theta2_reg;
    Theta1_grad = delta1/m + Theta1_reg;

    grad = [Theta1_grad(:) ; Theta2_grad(:)];                 % unroll gradients


end
