function [carsM, trucksM] = trainClassifier(X, y)
    len = length(y);
    carsM = mean(X(1:len/2, :));
    trucksM = mean(X(len/2+1:len, :));
end

