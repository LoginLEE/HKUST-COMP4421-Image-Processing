close all


img_name = ['1.JPG'];
img = imread(img_name);
figure, 
plot(131),imshow(img);


grayImg = rgb2gray(img);

figure, 
plot(131),imshow(grayImg);

img