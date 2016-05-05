function [accuracy, carspv, truckspv] = testFeatures(files)
% Run test for different sets of features.
% Usage: [accuracy, carspv, truckspv] = testFeatures(files)
% Files must be a cell type array.

    accuracy = [];
    carspv = [];
    truckspv = [];
    
    for i = 1:length(files)
        result = testFeatureSet(files{i});
        accuracy = [accuracy result(:, 1)];
        carspv = [carspv result(:, 2)];
        truckspv = [truckspv result(:, 3)];
    end
end

function res = testFeatureSet(filename)
    res = [];
    
    load(filename);
    [X, mu, sigma] = normalizeFeatures(X);
    
    mde = minimumDistance(false);
    mdm = minimumDistance(true);
    km = kMeans(2);
    nb = naiveBayes();
    nn = neuralNetwork(5);

    classifiers = {mde, mdm, km, nb, nn};

    for i = 1:length(classifiers)
        cl = classifiers{i};
        cl = train(cl, X, y);
        p = predict(cl, X);
        [tc, fc, tt, ft] = evaluateResult(X, y, p);
        acc = (rows(tc) + rows(tt)) / rows([tc; fc; tt; ft]) * 100;
        ppv = rows(tc) / (rows(tc) + rows(ft)) * 100;
        npv = rows(tt) / (rows(tt) + rows(fc)) * 100;
        res = [res; [acc ppv npv]];
    end
end