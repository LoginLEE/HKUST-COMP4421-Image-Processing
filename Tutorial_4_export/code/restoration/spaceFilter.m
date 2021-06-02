f = imread('lenna.jpg');
f = rgb2gray(f);
R = imnoise2('salt & pepper', 512, 512, 0.1, 0.1);
c = find(R == 0);
gp = f;
gp(c) = 0;
% c = find(R == 1);
% gp(c) = 255;
% figure, imshow(gp);

fp = spfilt(gp, 'amean', 3, 3);
 fpm = spfilt(gp, 'median', 5, 5);
 fpmax = spfilt(gp, 'max',2,2);
figure,imshow(fp);
 figure,imshow(fpm);
 figure,imshow(fpmax);


