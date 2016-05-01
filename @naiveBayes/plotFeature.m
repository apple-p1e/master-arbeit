function plotFeature(classifier, idx)
% Plot a bar chart for probability distribution of the feature.
% Feature must be a sctuct type.
% Usage: displayFeature(classifier, idx)
    
    c = classifier;
    feature = classifier.('features'){idx};
    barData = [];
    keys = sort(str2double(fieldnames(feature)));
    for i = 1:length(keys)
        barData = [barData; feature.(sprintf('%f', keys(i)))];
    end
    bar(barData);
    set(gca,'XTickLabel', keys);
end