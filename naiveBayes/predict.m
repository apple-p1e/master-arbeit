function res = predict(features, X)
    colX = size(X, 2);
    res = zeros(size(X));
    for i = 1:colX
        t = cell2mat(arrayfun(@(x) features(i).dict.(sprintf('%.2f', x)), X(:,i), 'UniformOutput', false));
        [_, p] = max(t, [], 2);
        res(:,i) = p;
    end
    res = round(sum(res,2)/colX);
end