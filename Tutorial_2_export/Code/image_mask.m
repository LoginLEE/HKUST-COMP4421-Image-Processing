% script for image spatial filtering
function image_mask
f = imread('charles_butter_2.jpg');
figure,imshow(f,'border','tight');

%{
%%%% average filter %%%%
mask = 1/9*ones(3,3);
mask2 = fspecial('average',[3,3]);
g = imfilter(f,mask);
figure,imshow(g,'border','tight');
g = imfilter(f,mask2);
figure,imshow(g,'border','tight');
mask = 1/25*ones(5,5);
h = imfilter(f,mask);
figure,imshow(h,'border','tight');
%}
% 
% % %%%% median filter %%%%
% g = medfilt2(f,[3,3]);
% figure,imshow(uint8(g),'border','tight');
% h = medfilt2(f,[5,5]);
% figure,imshow(uint8(h),'border','tight');
% 
%{
% % %%%% sharpening %%%%
mask = fspecial('sobel');
g = imfilter(f,mask,'replicate');
figure,imshow(g,'border','tight');
mask = fspecial('prewitt');
h = imfilter(f,mask,'replicate');
figure,imshow(h,'border','tight');
%}

% %%%% gradient mask %%%%
 [Fx Fy] = gradient(double(f));
 figure,imshow(uint8(Fx),'border','tight');
 figure,imshow(uint8(Fy),'border','tight');
 MF = sqrt(Fx.^2+Fy.^2);
 figure,imshow(uint8(MF),'border','tight');
