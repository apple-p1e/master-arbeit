function classifier = kMeans(nClusters)
    classifier = struct();
    classifier.('K') = nClusters;
    classifier = class(classifier, 'kMeans');
end