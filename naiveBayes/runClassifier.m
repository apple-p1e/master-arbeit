% Initialization
clear ; close all; clc

% Load training data
load('../data/features_new.mat')

% Train and predict on the training data
classifier = trainClassifier(X, y);
pred = predict(classifier, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);