f = checkerboard(20);
PSF = fspecial('motion',7,45);
gb = imfilter(f,PSF,'circular');
noise = normrnd(0,0.01^0.5,size(f));
gb = gb + noise;
figure,subplot(1,3,1);imshow(gb,[]); xlabel('noisy image');

fr1 = deconvwnr(gb, PSF);
subplot(1,3,2),imshow(fr1,[]); xlabel('inverse filtering');
 
Sn = abs(fftshift(fft2(noise))).^2; %noise power spectrum
nA = mean(Sn(:)); % noise average power;
Sf = abs(fftshift(fft2(f))).^2; %image power spectrum
fA = mean(Sf(:)); %image average spectrum
R = nA/fA;
fr2 = deconvwnr(gb,PSF,R);
subplot(1,3,3); imshow(fr2,[]);xlabel('Wiener filtering');
