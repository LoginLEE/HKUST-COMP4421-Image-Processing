f = ones(10,20);
F = fft2(f,500,500);
f1 = zeros(500,500);
f1(240:260,230:270) = 1;
S = abs(F);
Fc = fftshift(F);
S1 = abs(Fc);
S2 = log(1+S1);
figure,imshow(S);
figure,imshow(S1);
figure,subplot(2,2,1);imshow(f1);title('Input image')
subplot(2,2,2); imshow(S,[]);title('fft2')
subplot(2,2,3); imshow(S1,[]);title('fftshift(fft2)')
subplot(2,2,4);imshow(S2,[]);title('log enhanced fftshitft(fft2)')
