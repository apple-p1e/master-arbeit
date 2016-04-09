% Initialization
clear ; close all;

% Load training data
load('../data/features_new.mat')

% Obtain classes' centers and make prediction with them
printf('Running [Minimum Distance]\n');
[cC, tC] = trainClassifier(X, y);
printf('Finished training...\n');
pred = predict(cC, tC, X, 2);
printf('Finished prediction...\n');
% Sort result and display it
[tc, fc, tt, ft] = sortResult(X, y, pred);
printEvaluation(tc, tt, fc, ft);
if yes_or_no('Do you want to plot result?')
    plotResult(tc, fc, tt, ft, cC, tC);
end