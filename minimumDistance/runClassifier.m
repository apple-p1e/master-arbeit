% Initialization
clear ; close all; clc

% Load training data
load('features.mat')

% Obtain classes' centers and make prediction with them
[cC, tC] = trainClassifier(X, y);
pred = predict(cC, tC, X, 1);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

% Sort result and display it
[tc, fc, tt, ft] = sortData(X, y, pred);
displayData(tc, fc, tt, ft, cC, tC);