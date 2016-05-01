function classifier = train(c, X, y)
% Returns array with structures containing probability distribution of the
% feature.
% Usage: features = trainClassifier(X, y)

    CARS = 1;
    TRUCKS = 2;
    [m, n] = size(X);
    features = cell();
    classifier = c;
    
    % feature1 = roundData(X(:,1), [2 2.5 3 3.5 4]);
    % feature2 = roundData(X(:,2), [10 12.5 15 20 25]);

    for i = 1:n
        features{i} = countFeature(X(:,i));
    end

    classifier.('features') = features;

    function feature = countFeature(x)
        feature = struct();
        for c = 1:m
            val = sprintf('%f', x(c));
            if not(isfield(feature, val))
                feature.(val) = [0 0];
            end
            if y(c) == CARS
                feature.(val)(CARS) += 1;
            else
                feature.(val)(TRUCKS) += 1;
            end
        end
    end

end