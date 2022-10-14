% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test_speckle.m
% Author: Jingjing Jiang jing.jing.jiang@outlook.com
% created: 2022.10.14
% modified:
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% read in image
I = imread('circuit.tif'); %2D, this is an example image from MATLAB
hf = figure;
subplot(221)
imshow(I)
title('original')

I = double(I);
size(I)
figure(hf)
subplot(222)
imagesc(I)
title('raw double')
%% calculate speckle contrast K
% block size: N x N
N = 5;
K = get_speckle(I, N);
figure(hf)
subplot(223)
imagesc(K)
colorbar
title('speckle contrast')
%% calculate relative velocity
% T: exposure time
T = 1; % for testing
V = 1./(T.*K.*K);
figure(hf)
subplot(224)
imagesc(V)
colorbar
title('relative velocity')