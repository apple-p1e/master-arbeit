function [true_cars, false_cars, true_trucks, false_trucks] = evaluateResult(X, y, pred)
% Sort predicted vehicles by type I and type II errors.
% Usage: [true_cars, false_cars, true_trucks, false_trucks] = evaluateResult(X, y, pred)

    true_cars = X(y == pred & y == 1, :);
    false_cars = X(y ~= pred & y == 2, :);
    true_trucks = X(y == pred & y == 2, :);
    false_trucks = X(y ~= pred & y == 1, :);
end