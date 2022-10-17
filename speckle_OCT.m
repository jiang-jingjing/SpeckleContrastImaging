% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% speckle_OCT.m
% Author: Jingjing Jiang jing.jing.jiang@outlook.com
% created: 2022.10.17
% modified:
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% read in image
img3d = tiffreadVolume('../Data_OCT/161048190_AvgOCT.tif'); %2D, this is an example image from MATLAB

%% visualize 3 cross sections
coord = [1085, 150 150];
figure, 
subplot(131)
imagesc(squeeze(img3d(coord(1),:,:)))
axis equal
title(['x = ' num2str(coord(1))])
subplot(132)
imagesc(squeeze(img3d(:,coord(2),:)))
axis equal
title(['y = ' num2str(coord(2))])
subplot(133)
imagesc(squeeze(img3d(:,:,coord(3))))
axis equal
title(['z = ' num2str(coord(3))])

%% show the selected cross section
I = squeeze(img3d(coord(1),:,:));
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