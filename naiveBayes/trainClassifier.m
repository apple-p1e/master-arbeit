function features = trainClassifier(X, y)
% Returns array with structures containing probability distribution of the
% feature.
% Usage: features = trainClassifier(X, y)

    CARS = 1;
    TRUCKS = 2;
    len = length(y);
    
    % feature1 = roundData(X(:,1), [2 2.5 3 3.5 4]);
    % feature2 = roundData(X(:,2), [10 12.5 15 20 25]);
    feature1 = X(:,1);
    feature2 = X(:,2);
    feature3 = X(:,3);
    feature4 = X(:,4);
    
    features = [countFeature(feature1, 'GAM1') 
        countFeature(feature2, 'GAM2')
        countFeature(feature3, 'Positive Spitze') 
        countFeature(feature4, 'Positive Spitze')];

    function feature = countFeature(x, name)
        feature = struct();
        feature.('name') = name;
        feature.('dict') = struct();
        for c = 1:len
            val = sprintf('%.2f', x(c));
            if not(isfield(feature.dict, val))
                feature.dict.(val) = [0 0];
            end
            if y(c) == CARS
                feature.dict.(val)(CARS) += 1;
            else
                feature.dict.(val)(TRUCKS) += 1;
            end
        end
    end

end