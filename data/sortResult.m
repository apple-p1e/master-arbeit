function [true_cars, false_cars, true_trucks, false_trucks] = sortResult(X, y, pred)
% Sort predicted vehicles by type I and type II errors.
% Usage: [true_cars, false_cars, true_trucks, false_trucks] = sortResult(X, y, pred)
    len = length(y);
    tc = y(1:len/2,:) == pred(1:len/2,:);
    tt = y(len/2+1:len,:) == pred(len/2+1:len,:);

    true_cars = X(find(tc),:);
    false_cars = X(find(!tc),:);
    true_trucks = X(len/2 + find(tt),:);
    false_trucks = X(len/2 + find(!tt),:);
end