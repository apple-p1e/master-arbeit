function classifier = train(c, X, y)
% Return centroids of the classes.
% Usage: [carsM, trucksM] = trainClassifier(X, y)
    
    classifier = c;
    classes = unique(y);
    cNumber = length(classes);
    centroids = zeros(cNumber, size(X, 2));
    for i = 1:cNumber
        centroids(i, :) = mean(X(y==i, :));
    end
    classifier.('centroids') = centroids;
end