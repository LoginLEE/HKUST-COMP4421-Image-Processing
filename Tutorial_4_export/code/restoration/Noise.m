%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Image Denoising Techniques  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% read the CAMERAMAN image into MATLAB
name='camera.ras';
x=imread(name);
% whos x

% display the image
figure,imshow(x);

%%%%%%%%%%%%%%%%%%%%%%%%%
% Type-I: Impulse Noise %
%%%%%%%%%%%%%%%%%%%%%%%%%

% impulse noise added to image
y1=imnoise(x,'salt & pepper',0.02);                    
figure,imshow(y1);
y2=imnoise(x,'salt & pepper',0.5);                    
figure,imshow(y2);

g1 = imnoise(x, 'gaussian', 0, 0.01);
figure, imshow(g1);
g2 = imnoise(x, 'gaussian', 0, 0.1);
figure, imshow(g2);
%  
r = imnoise2('gaussian',256,256,0,1);
p = hist(r(:),50);
figure,bar(p);




