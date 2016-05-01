function classifier = minimumDistance(Mahalanobis)
    classifier = struct();
    classifier.('mahalanobis') = Mahalanobis;
    classifier = class(classifier, 'minimumDistance');
end