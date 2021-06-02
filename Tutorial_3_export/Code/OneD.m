M = 1000;
f = zeros(1, M);
l = 10;
f(M/2-l:M/2+l) = 1;
figure,plot(f);
F = fft(f);
Fc = fftshift(F);
rFc = real(Fc);
iFc = imag(Fc);
figure,subplot(2,1,1),plot(abs(F));title('Result after fft')
subplot(2,1,2),plot(abs(Fc));title('Result after fftshift')