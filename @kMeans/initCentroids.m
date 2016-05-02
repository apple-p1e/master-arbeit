function classifier = initCentroids(c, X, K)
    
    classifier = c;    
    randidx = randperm(size(X,1));
    centroids = X(randidx(1:K), :);
    classifier.('centroids') = centroids;

end