%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Super-Resolution of Pixel-Art based on the EPX algorithm %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Setup
close all
clc

factor = 16;

%% Compute higher-resolution images
small_img = imread('img/1.tif');

tic;
large_img = pixelartsuperres(small_img, factor);
t1 = toc;
fprintf('Time to execute pixelartsuperres.m: %1.2f\n', t1);

tic;
img_nearest = imresize(small_img, factor, 'nearest');
t2 = toc;
fprintf('Time to execute nearest neighbor algorithm: %1.2f\n', t2);

%% Display results
figure;
imshow(small_img);
title('Original');

figure;
subplot(121)
imshow(large_img);
title('Enlarged (our algorithm)');
subplot(122)
imshow(img_nearest);
title('Enlarged (nearest neighbor algorithm)');
