function res = predict(c, X)
% Predict class of the input data X using trained classifier. Returns a vector
% of predicted labels.
% Usage: res = predict(features, X)
    
    classifier = c;
    features = classifier.('features');
    n = size(X, 2);
    res = zeros(size(X));
    for i = 1:n
        bounds = sort(cellfun(@(x) str2num(x), fieldnames(features{i})));
        feature = roundData(classifier, X(:,i), bounds);% prevent unknown values
        t = cell2mat(arrayfun(@(x) features{i}.(sprintf('%f', x)), ...
            feature, 'UniformOutput', false));        % get probability for both
        [_, p] = max(t, [], 2);               % classes and select a maximum one
        res(:,i) = p;
    end
    res = round(sum(res,2)/n);              % "voting" of feature classifiers
end