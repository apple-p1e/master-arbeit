% Initialization
clear ; close all;

% Setup the parameters
input_layer_size = 4;
hidden_layer_size = 5;
num_labels = 2;

% Load training data
load('../data/features_new.mat')

% Train and predict on the training data
fprintf('Running [Neural Network]\n');
[Theta1, Theta2] = trainClassifier(input_layer_size, ...
                                   hidden_layer_size, num_labels, X, y);
fprintf('Finished training...\n');                 
pred = predict(Theta1, Theta2, X);
fprintf('Finished prediction...\n');
[tc, fc, tt, ft] = sortResult(X, y, pred);
printEvaluation(tc, tt, fc, ft);
if yes_or_no('Do you want to plot result?')
    plotResult(tc, fc, tt, ft);
end