% Initialization
clear ; close all;

% Load training data
load('../data/features_new.mat')

% Train and predict on the training data
printf('Running [Naive Bayes]\n');
classifier = trainClassifier(X, y);
printf('Finished training...\n');
pred = predict(classifier, X);
printf('Finished prediction...\n');
[tc, fc, tt, ft] = sortResult(X, y, pred);
printEvaluation(tc, tt, fc, ft);
if yes_or_no('Do you want to plot result?')
    plotResult(tc, fc, tt, ft);
end