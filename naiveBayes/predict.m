function res = predict(features, X)
% Predict class of the input data X using trained classifier. Returns a vector
% of predicted labels.
% Usage: res = predict(features, X)

    colX = size(X, 2);
    res = zeros(size(X));
    for i = 1:colX
        bounds = sort(cellfun(@(x) str2num(x), fieldnames(features(i).dict)));
        feature = roundData(X(:,i), bounds);            % prevent unknown values
        t = cell2mat(arrayfun(@(x) features(i).dict.(sprintf('%.2f', x)), ...
            feature, 'UniformOutput', false));        % get probability for both
        [_, p] = max(t, [], 2);               % classes and select a maximum one
        res(:,i) = p;
    end
    res = round(sum(res,2)/colX);              % "voting" of feature classifiers
end