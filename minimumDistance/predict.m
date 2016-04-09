function res = predict(carsC, trucksC, X, f)
% Predict class using Euclidean or Mahalanobis distance.
% Usage: res = predict(carsC, trucksC, X, f)
% f == 1 for Mahalanobis distance, else for Euclidean
    
    if f == 1
        func = @(x) calcMahalanobis(x);
    else
        func = @(x) calcEuclidean(x);
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