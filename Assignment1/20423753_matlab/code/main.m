clc
clear

img = imread('53.png');

%% --------------- Task 1: Spatial Linear Filtering --------------- 
averaging_mask = 1/25*ones(5,5);
sobelX_mask = [1,0,-1;2,0,-2;1,0,-1];
sobelY_mask = [1,2,1;0,0,0;-1,-2,-1];
laplacian_mask = [0,1,0;1,-4,1;0,1,0];

ave_result = filter_spa(img, averaging_mask);
sobelX_result = filter_spa(img, sobelX_mask);
sobelY_result = filter_spa(img, sobelY_mask);
laplacian_result = filter_spa(img, laplacian_mask);

subplot(221), imshow(ave_result), title('Averaging')
subplot(222), imshow(sobelX_result), title('Sobel X')
subplot(223), imshow(sobelY_result), title('sobel Y')
subplot(224), imshow(laplacian_result), title('Laplacian')

%%  --------------- Task 2: Spatial Non-linear Filtering  --------------- 

% add gaussian noises to the original input image
img_gau = noiseGenerate(img,0,0,30);

% add salt-and-pepper noises to the original input image
img_sp = noiseGenerate(img,1,0.3,0.3);

size = 3;

gau_result = medfilt2d(img_gau, size);
sp_result = medfilt2d(img_sp, size);

figure,
subplot(121), imshow(gau_result), title('Median Filter with Gaussian Noises')
subplot(122), imshow(sp_result), title('Median Filter with Salt-and-Pepper Noises')

%%  --------------- Task 3: Discrete Fourier Transform  --------------- 
dft_img = dft_2d(img, 'DFT');

% Compute the Fourier Spectrum. Remember to do the enhancement.
dft_spectrum = log(1.+abs(dft_img));
dft_spectrum = mat2gray(dft_spectrum);

idft_img = dft_2d(dft_img, 'IDFT');

% Transform idft_img to a real-value matrix
real_img = idft_img;
real_img = mat2gray(real_img);

figure,
subplot(121), imshow(dft_spectrum), title('Fourier Spectrum')
subplot(122), imshow(real_img), title('Image after IDFT')

%% ---------- Task 4: Filtering in the Frequency Domain -----------
averaging_mask = 1/25*ones(5,5);
laplacian_mask = [0,1,0;1,-4,1;0,1,0];

ave_freq = filter2d_freq(img, averaging_mask);
laplacian_freq = filter2d_freq(img, laplacian_mask);

figure,
subplot(121), imshow(ave_freq), title('Averaging in Frequancy Domain')
subplot(122), imshow(laplacian_freq), title('Sharpen in Frequency Domain')

%% Task 5: High-Frequency Emphasis
a = 0.1;
b = 2.0;

butter_result = high_freq_emphasis(img, a, b, 'butterworth');
gaussian_result = high_freq_emphasis(img, a, b, 'gaussian');

figure,
subplot(121), imshow(butter_result), title('Using Butterworth')
subplot(122), imshow(gaussian_result), title('Using Gaussian')
