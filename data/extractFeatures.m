function features = extractFeatures(data)
% Extract features from the input signal data (must be a cell type).

    OFFSET = 15;                             % several constants for cutting off
    SI1 = 5; SI2 = 2;                          % service information from signal
    features = [];

    for i = 1:length(data)
        signal = data{i}(SI1+OFFSET:end-(SI2+OFFSET));
        hills = extractHills(signal);                       % apply hill pattern
        [posHills, negHills] = countHills(hills);
        fourier = abs(fft(signal));
        fourier = fourier(1:1+length(fourier)/2);
        bounds = unique(fourier);       % Amplitudenverteilungsdichte (amplitude
        avd = histc(fourier, bounds)/length(fourier);    % distribution density)
        xgrw = mean(fourier);        % Gleichrichtwert (average rectified value)
        mom2 = sum(avd .* (bounds - xgrw).^2);                  % Zentralmomente
        mom3 = sum(avd .* (bounds - xgrw).^3);               % (central moments)
        mom4 = sum(avd .* (bounds - xgrw).^4);
        gam1 = mom3/(sqrt(mom2)^3);                         % Schiefe (skewness)
        gam2 = mom4/(mom2^2);                                % Exzess (kurtosis)
        features = [features;gam1 gam2 posHills negHills];
    end
end

function hills = extractHills(data)
% Convert discrete signal by the hill pattern: if a value of the signal is less
% than below threshold value, it is convertred to -1; if it is more than above
% threshold value – to 1; if it is between two thresholds – to 0. 

    MEAN = 127;
    THRESHOLD = 10;
    hills = arrayfun(@(x) compareValue(x, MEAN, THRESHOLD), data);
end

function res = compareValue(val, meanVal, threshold)
    if val > meanVal+threshold
        res = 1;
    elseif val < meanVal-threshold
        res = -1;
    else
        res = 0;
    end
end

function [positiveHills, negativeHills] = countHills(hills)
% Count positive and negative hills on the assumption of whether signal changed
% its value.

    positiveHills = negativeHills = 0;
    prev = 0; len = length(hills);
    for i = 1:len
        if hills(i) ~= prev
            if hills(i) < 0
                negativeHills++;
            elseif hills(i) > 0
                positiveHills++;
            end
        end
        prev = hills(i);
    end
end