function plotHillPatterns(hills)
    m = length(hills);
    prev = 0;
    res = [];
    for i = 1:m
        cur = hills(i);
        if cur ~= prev
            res = [res; i prev];
        end
        res = [res; i cur];
        prev = cur;
    end
    plot(res(:,1), res(:,2), 'Color', [0.2 0.2 0.7], 'LineWidth', 2);
end