function classifier = train(c, X, K)
    classifier = c;
    classifier = initCentroids(classifier, X, K);
    for i = 1:10
        % For each example in X, assign it to the closest centroid
        idx = predict(classifier, X);
        % Given the memberships, compute new centroids
        centroids = computeCentroids(classifier, X, idx, K);
    end
    classifier.('centroids') = centroids;
end