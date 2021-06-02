Im=imread('example.bmp');
ft=fft2(Im);
fts=fftshift(ft);
figure;imshow(abs(fts),[]);title('Amplitude');
x =(1+abs(fts))
figure;imshow(log(1+abs(fts)),[]);title('Normalized Amplitude');
figure;imagesc(unwrap(angle(fts)));title('Phase');
orift=ifftshift(fts);
oriIm=ifft2(orift);
figure;imshow(oriIm,[]);

