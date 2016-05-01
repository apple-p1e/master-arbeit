function plot3DResult(tc, fc, tt, ft, cC, tC)
    COL1 = [0.1 0.1 0.9]; COL2 = [1.0 .05 .05];            % blue and red colors
    COL3 = [0.1 0.8 0.9]; COL4 = [1.0 0.8 0.1];         % cyan and yellow colors
    K = 3;
    PSIZE = 8;
    temp = [tc; fc; tt; ft];
    [U, S] = pca(temp);
    tcz = projectData(tc, U, K);
    fcz = projectData(fc, U, K);
    ttz = projectData(tt, U, K);
    ftz = projectData(ft, U, K);
    figure; hold on;
    if size(tc) scatter3(tcz(:,1), tcz(:,2), tcz(:,3), PSIZE, COL3, '*'); end
    if size(fc) scatter3(fcz(:,1), fcz(:,2), fcz(:,3), PSIZE, COL1, '*'); end
    if size(tt) scatter3(ttz(:,1), ttz(:,2), ttz(:,3), PSIZE, COL4, '*'); end
    if size(ft) scatter3(ftz(:,1), ftz(:,2), ftz(:,3), PSIZE, COL2, '*'); end
    if nargin == 6
        c = [cC; tC];                                         % classes' centers
        cz = projectData(c, U, K);
        scatter3(cz(:,1), cz(:,2), cz(:,3), 15, 'black', 'x');   % display centers
    end
    hold off;
end