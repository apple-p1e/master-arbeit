function data = roundData(x, bounds)
    data = [];
    medians = [];
    lenBounds = length(bounds);
    lenX = length(x);
    for i = 1:(lenBounds-1)
        medians = [medians, (bounds(i+1)-bounds(i))/2 + bounds(i)];
    end
    for i = 1:lenX
        if x(i) > medians(lenBounds-1)
            data = [data bounds(lenBounds)];
            continue
        end
        for k = 1:(lenBounds-1)
            if x(i) <= medians(k)
                data = [data bounds(k)];
                break
            end
        end
    end
end