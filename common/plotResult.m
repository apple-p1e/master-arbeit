function plotResult(data, centroids)
    COL1 = [0.1 0.1 0.9]; COL2 = [1.0 .05 .05];            % blue and red colors
    COL3 = [0.1 0.8 0.9]; COL4 = [1.0 0.8 0.1];         % cyan and yellow colors
    colors = {COL3, COL2, COL4, COL1};
    PSIZE = 8;
    
    temp = [data{1}; data{2}; data{3}; data{4}];
    [U, S] = pca(temp);

    if size(temp, 2) > 2
        K = 3;
        func = @(x, k) scatter3(x(:,1), x(:,2), x(:,3), PSIZE, k, '*');
    else
        K = 2;
        func = @(x, k) scatter(x(:,1), x(:,2), PSIZE, k, '*');
    end
    
    figure; hold on;

    for i = 1:4
        d = data{i};
        if size(d)
            dz = projectData(d, U, K);
            color = colors{i};
            func(dz, color);
        end        
    end

    if centroids
        cz = projectData(centroids, U, K);
        if K == 3
            scatter3(cz(:,1), cz(:,2), cz(:,3), 15, 'black', 'x');
        else
            scatter(cz(:,1), cz(:,2), 15, 'black', 'x');
        end
    end

    hold off;
end