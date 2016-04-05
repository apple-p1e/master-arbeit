function [barData, keys] = displayFeature(feature)
    barData = [];
    data = feature.dict;
    keys = sort(str2double(fieldnames(data)));
    for i = 1:length(keys)
        barData = [barData; data.(sprintf('%.2f', keys(i)))];
    end
    bar(barData);
    title(feature.name);
    set(gca,'XTickLabel', keys);
end