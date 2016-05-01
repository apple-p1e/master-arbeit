function res = predict(classifier, X)
% Predict class using Euclidean or Mahalanobis distance.
% Usage: res = predict(carsC, trucksC, X)

    c = classifier;
    centroids = c.('centroids');
    if c.('mahalanobis')
        func = @(x) calcMahalanobis(x);
    else
        func = @(x) calcEuclidean(x);
    end
    distances = [];
    for i = 1:size(centroids, 1)
        distances = [distances func(centroids(i,:))];
    end

    [_, res] = min(distances, [], 2);
    
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