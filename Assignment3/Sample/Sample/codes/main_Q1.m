clc
clear
close all

% Assignment 2
% img - original input image
% img_marked - image with marked sides and corners detected by Hough transform
% corners - the 4 corners of the target A4 paper
% img_warp - the standard A4-size target paper obtained by image warping
% n - determine the size of the result image

% define the n by yourself
n = 4;
%3024,4032
% Manually detemine the corner points for six input images

Corners = [[641.0526, 575.4525, 3768.6391, 504.4776, 682.1057, 2713.5246, 3780.4323, 2756.7882],
    [3024 - 2713.5246, 682.1057, 3024 - 575.4525, 641.0526, 3024 - 2756.7882, 3780.4323, 3024 - 504.4776, 3768.6391],
    [3024 - 2713.5246, 682.1057, 3024 - 575.4525, 641.0526, 3024 - 2756.7882, 3780.4323, 3024 - 504.4776, 3768.6391],
    [3024 - 2713.5246, 682.1057, 3024 - 575.4525, 641.0526, 3024 - 2756.7882, 3780.4323, 3024 - 504.4776, 3768.6391],
    [3024 - 2713.5246, 682.1057, 3024 - 575.4525, 641.0526, 3024 - 2756.7882, 3780.4323, 3024 - 504.4776, 3768.6391],
    [3024 - 2713.5246, 682.1057, 3024 - 575.4525, 641.0526, 3024 - 2756.7882, 3780.4323, 3024 - 504.4776, 3768.6391]];

inputs = [1];
%inputs = [1,2,3,4,5,6];
for i = 1:length(inputs)
    img_name = ['../input_imgs/Q1/', num2str(inputs(i)), '.JPG'];
    img = imread(img_name);
    % Run your Hough transform of Assignment 2 Q3 to obtain the corners.
    % You can also find the corners manually. If so, please change the following code accrodingly
    %[img_marked, corners] = hough_transform(img);
    corners = Corners(i, :);
    %img_warp = img_warping(img, corners, n);
    img_warping(img, corners, n)
    figure, 
    subplot(131),imshow(img);
    %subplot(132),imshow(img_marked);
    %subplot(133),imshow(img_warp);
end