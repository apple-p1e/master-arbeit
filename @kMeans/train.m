function classifier = train(c, X, y)
    centroids = [];
    accuracy = 0;
    for j = 1:10
        classifier = c;
        K = classifier.('K');
        classifier = initCentroids(classifier, X, K);
        idx = [];
        for i = 1:10
            % For each example in X, assign it to the closest centroid
            idx = predict(classifier, X);
            % Given the memberships, compute new centroids
            classifier = computeCentroids(classifier, X, idx, K);
        end
        [tc, fc, tt, ft] = evaluateResult(X, y, idx);
        acc = (rows(tc) + rows(tt)) / rows([tc; fc; tt; ft])
        if acc > accuracy
            accuracy = acc;
            centroids = classifier.('centroids');
        end
    end
    classifier.('centroids') = centroids;
end