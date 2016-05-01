function plot2DResult(tc, fc, tt, ft, cC, tC)
    COL1 = [0.1 0.1 0.9]; COL2 = [1.0 .05 .05];            % blue and red colors
    COL3 = [0.1 0.8 0.9]; COL4 = [1.0 0.8 0.1];         % cyan and yellow colors
    PSIZE = 8;
    K = 2;
    temp = [tc; fc; tt; ft];
    [U, S] = pca(temp);
    tcz = projectData(tc, U, K);
    fcz = projectData(fc, U, K);
    ttz = projectData(tt, U, K);
    ftz = projectData(ft, U, K);
    figure; hold on;
    if size(tc) scatter(tcz(:,1), tcz(:,2), PSIZE, COL3, '*'); end
    if size(fc) scatter(fcz(:,1), fcz(:,2), PSIZE, COL1, '*'); end
    if size(tt) scatter(ttz(:,1), ttz(:,2), PSIZE, COL4, '*'); end
    if size(ft) scatter(ftz(:,1), ftz(:,2), PSIZE, COL2, '*'); end
    if nargin == 6
        c = [cC; tC];                                         % classes' centers
        cz = projectData(c, U, K);
        scatter(cz(:,1), cz(:,2), 15, 'black', 'x');           % display centers
    end
    hold off;
end