% image gradient
clear all; close all; clc;
f = imread('charles_butter_2.jpg');

[fx,fy] = gradient(double(f));

df = sqrt(fx.^2+fy.^2);
figure;imshow(f,'Border','tight');, title('original');
figure;imshow(uint8(fx),'Border','tight'), title('df/dx');
figure;imshow(uint8(fy),'Border','tight'), title('df/dy');
figure;imshow(uint8(df),'Border','tight'), title('magnitude');