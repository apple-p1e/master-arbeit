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