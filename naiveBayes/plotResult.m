function plotResult(tc, fc, tt, ft)
% Display result of the classification.
% Usage: plotResult(tc, fc, tt, ft)
% tc == true cars; fc == false cars
% tt == true trucks; ft == false trucks
    
    F2 = 2; F3 = 3; F4 = 4;                                  % feature's numbers
    BLUE = [0.1 0.1 1]; RED = [1 0.3 0.1];                              % colors
    CYAN = [0.1 0.8 1]; GREEN = [0.0 0.5 0.0];
    PSIZE = 8;                                                  % size of points

    figure; hold on;

    % display vehicles
    if size(tc) scatter3(tc(:,F2), tc(:,F3), tc(:,F4), PSIZE, CYAN); end
    if size(fc) scatter3(fc(:,F2), fc(:,F3), fc(:,F4), PSIZE, BLUE); end
    if size(tt) scatter3(tt(:,F2), tt(:,F3), tt(:,F4), PSIZE, RED); end
    if size(ft) scatter3(ft(:,F2), ft(:,F3), ft(:,F4), PSIZE, GREEN); end

    xlabel('gam2'); ylabel('pos'); zlabel('neg');
    hold off;

end