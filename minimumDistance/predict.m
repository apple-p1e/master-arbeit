function res = predict(carsC, trucksC, X, f)
% Predict class using Euclidean or Mahalanobis distance.
% Usage: res = predict(carsC, trucksC, X, f)
% f == 1 for Euclidean distance, else for Mahalanobis
    
    if f == 1
        func = @(x) calcEuclidean(x);
    else
        func = @(x) calcMahalanobis(x);
    end

    [_, res] = min([func(carsC) func(trucksC)], [], 2);
    
    function distance = calcEuclidean(point)
        distance = sqrt(sum(bsxfun(@minus, point, X).^2, 2));
    end

    function distance = calcMahalanobis(point)
        distance = [];
        len = size(X,1);
        for i = 1:len
            distance = [distance; mahalanobis(point', X(i, :)')];
        end
    end
end