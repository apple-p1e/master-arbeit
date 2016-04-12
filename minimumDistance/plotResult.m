function plotResult(tc, fc, tt, ft, cC, tC)
% Takes labled data and centers of classes and displays it.
% Usage: plotResult(tc, fc, tt, ft, cC, tC)
% tc == true cars; fc == false cars
% tt == true trucks; ft == false trucks
% cC == cars center; tC == trucks center
    
    F2 = 2; F3 = 3; F4 = 4;                                  % feature's numbers
    COL1 = [0.1 0.1 0.9]; COL2 = [1.0 .05 .05];            % blue and red colors
    COL3 = [0.1 0.8 0.9]; COL4 = [1.0 0.8 0.1];         % cyan and yellow colors
    PSIZE = 8;                                                  % size of points

    figure; hold on;

    % xt = @(t) p(2) * t + cC(2);
    % yt = @(t) p(3) * t + cC(3);
    % zt = @(t) p(4) * t + cC(4);
    % t = [-0.3 3.5];
    % plot3(xt(t), yt(t), zt(t));

    % display vehicles
    if size(tc) scatter3(tc(:,F2), tc(:,F3), tc(:,F4), PSIZE, COL3); end
    if size(fc) scatter3(fc(:,F2), fc(:,F3), fc(:,F4), PSIZE, COL1); end
    if size(tt) scatter3(tt(:,F2), tt(:,F3), tt(:,F4), PSIZE, COL4); end
    if size(ft) scatter3(ft(:,F2), ft(:,F3), ft(:,F4), PSIZE, COL2); end

    c = [cC; tC];                                             % classes' centers
    scatter3(c(:,2), c(:,3), c(:,4), 15, 'black', 'x');        % display centers

    mid = (cC+tC)./2; p = tC - cC;                % middle point between centers
    _ = [tc; fc; tt; ft];                       % getting all data back together
    minPos = min(_(:,3)); maxPos = max(_(:,3));          % boundaries for y axis
    minNeg = min(_(:,4)); maxNeg = max(_(:,4));          % boundaries for z axis
    [ys zs] = meshgrid(minPos:1:maxPos, minNeg:1:maxNeg);       % y and z points
    xs = -(p(3)*(ys-mid(3)) + p(4)*(zs-mid(4))) / p(2) + mid(2);      % x points
    mesh(xs, ys, zs, ones(size(zs)));                 % display dividing surface

    xlabel('gam2'); ylabel('pos'); zlabel('neg');
    hold off;

end