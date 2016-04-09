% Initialization
clear ; close all;

% Setup the parameters
input_layer_size = 4;
hidden_layer_size = 5;
num_labels = 2;

% Load training data
load('../data/features_new.mat')

% Load parameters
printf('Running [Neural Network]\n');
printf('Initializing Neural Network Parameters ...\n')
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

printf('Training Neural Network... \n')

options = optimset('MaxIter', 50);
lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
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
                 
pred = predict(Theta1, Theta2, X);
[tc, fc, tt, ft] = sortResult(X, y, pred);
printEvaluation(tc, tt, fc, ft);
if yes_or_no('Do you want to plot result?')
    plotResult(tc, fc, tt, ft);
end