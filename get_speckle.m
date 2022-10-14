% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function K = get_speckle(I, N)
% calculate speckle contrast K
% I: X x Y image
% block size: N x N
% Author: Jingjing Jiang jing.jing.jiang@outlook.com
% created: 2022.10.14
% modified:
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function K = get_speckle(I, N)
    sigma = stdfilt(I, ones(N));
    mu = imfilter(I, ones(N));
    K = sigma ./ mu;
end