function c = train(classifier, X, y)
% Returns weight matrices Theta1 and Theta2.
% Usage: [Theta1, Theta2] = trainClassifier(classifier, X, y)
    
    c = classifier;
    input_layer_size = size(X, 2);
    hidden_layer_size = c.('hidden_layer_size');
    num_labels = length(unique(y));

    initial_Theta1 = initWeights(c, input_layer_size, hidden_layer_size);
    initial_Theta2 = initWeights(c, hidden_layer_size, num_labels);
    initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
    options = optimset('MaxIter', 50);
    lambda = 1;

    % Create "short hand" for the cost function to be minimized
    costFunction = @(p) nnCostFunction(c, p, input_layer_size, ...
                                       hidden_layer_size, ...
                                       num_labels, X, y, lambda);
    % Now, costFunction is a function that takes in only one argument (the
    % neural network parameters)
    [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

    % Obtain Theta1 and Theta2 back from nn_params
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                     hidden_layer_size, (input_layer_size + 1));

    Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                     num_labels, (hidden_layer_size + 1));

    c.('Theta1') = Theta1;
    c.('Theta2') = Theta2;

end