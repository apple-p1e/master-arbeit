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