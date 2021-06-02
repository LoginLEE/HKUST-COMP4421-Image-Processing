f = checkerboard(20);
figure,subplot(1,3,1); imshow(f,[]); xlabel('original image')
PSF = fspecial('motion',7,45);
gb = imfilter(f,PSF,'circular');
subplot(1,3,2); imshow(gb,[]); xlabel('motion blurred')
fr = deconvwnr(gb,PSF);%no noise,inverse
subplot(1,3,3); imshow(fr,[]);xlabel('restored');
