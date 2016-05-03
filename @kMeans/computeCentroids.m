function classifier = computeCentroids(c, X, idx, K)

    classifier = c;
    [m n] = size(X);
    centroids = zeros(K, n);
    for i = 1:K
        centroids(i,:) = mean(X(idx == i,:));
    end
    classifier.('centroids') = centroids;

end