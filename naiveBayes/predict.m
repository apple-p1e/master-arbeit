function res = predict(features, X)
    len = size(X, 1);
    res = zeros(len, 1);
    for i = 1:len
        t = zeros(4,2);
        for j = 1:2
            % feature1 = roundData(X(i, 1), [2 2.5 3 3.5 4]);
            prob1 = features(1).dict.(sprintf('%.2f', X(i, 1)))(j)/180;
            t(1, j) = log(prob1);
            % feature2 = roundData(X(i, 2), [10 12.5 15 20 25]);
            prob2 = features(2).dict.(sprintf('%.2f', X(i, 2)))(j)/180;
            t(2, j) = log(prob2);
            prob3 = features(3).dict.(sprintf('%.2f', X(i, 3)))(j)/180;
            t(3, j) = log(prob3);
            prob4 = features(4).dict.(sprintf('%.2f', X(i, 4)))(j)/180;
            t(4, j) = log(prob4);
        end
        [_, p] = max(t, [], 2);
        res(i) = round(sum(p)/length(p));
    end
end