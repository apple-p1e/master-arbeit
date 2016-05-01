function idx = predict(c, X)

    classifier = c;
    centroids = classifier.('centroids');
    K = size(centroids, 1);

    distances = [];
    for i = 1:K
        distances = [distances calcEuclidean(centroids(i,:))];
    end

    [_, idx] = min(distances, [], 2);

    function distance = calcEuclidean(point)
        distance = sqrt(sum(bsxfun(@minus, point, X).^2, 2));
    end

end