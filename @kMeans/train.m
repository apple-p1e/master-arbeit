function classifier = train(c, X, y)
    if nargin == 2
        % case of unsupervised learning
        [_, classifier] = runTraining(c, X);
    else
        % if we know true labels of training set, we can chose the best result
        centroids = [];
        accuracy = 0;
        classifier = c;
        for j = 1:10
            [idx, cl] = runTraining(c, X);
            [tc, fc, tt, ft] = evaluateResult(X, y, idx);
            acc = (rows(tc) + rows(tt)) / rows([tc; fc; tt; ft]);
            if acc > accuracy
                accuracy = acc;
                centroids = cl.('centroids');
            end
        end
        classifier.('centroids') = centroids;
    end
end

function [idx, classifier] = runTraining(c, X)
    classifier = c;
    K = classifier.('K');
    classifier = initCentroids(classifier, X, K);
    for i = 1:10
        % For each example in X, assign it to the closest centroid
        idx = predict(classifier, X);
        % Given the memberships, compute new centroids
        classifier = computeCentroids(classifier, X, idx, K);
    end
end
