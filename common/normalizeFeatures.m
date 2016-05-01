function [X_norm, mu, sigma] = normalizeFeatures(X, mu, sigma)

    if nargin == 1
        mu = mean(X);
    end
    X_norm = bsxfun(@minus, X, mu);

    if nargin == 1
        sigma = std(X_norm);
    end
    X_norm = bsxfun(@rdivide, X_norm, sigma);

end
