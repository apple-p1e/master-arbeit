function centroids = getCentroids(c)
    classifier = c;
    centroids = classifier.('centroids');
end