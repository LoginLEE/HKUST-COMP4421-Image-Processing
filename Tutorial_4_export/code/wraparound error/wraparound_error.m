img = imread('22.png');
[H,W] = size(img);

mask = ones(7) / 49;
[h,w] = size(mask);

%{
padding = (h-1)/2;
% Padding the neighbor intensity around the original image
pad_left = zeros(H, padding);
for i = 1:padding
    pad_left(:,i) = img(:,1);
end
pad_right = zeros(H, padding);
for i = 1:padding
    pad_right(:,i) = img(:, W);
end

input_tmp = [pad_left, img, pad_right];
[h_tmp, w_tmp] = size(input_tmp);

pad_up = zeros(padding, w_tmp);
for i = 1:padding
    pad_up(i,:) = input_tmp(1,:);
end
pad_down = zeros(padding, w_tmp);
for i = 1:padding
    pad_down(i,:) = input_tmp(h_tmp,:);
end

img = [pad_up;input_tmp;pad_down];
%}

% {
M = fix(size(img,1)/2);
N = fix(size(img,2)/2);
filter_padding = zeros(size(img));
% padding the filter
for x = 1:h
    for y = 1:w
        filter_padding(M-2+x, N-2+y) = mask(x,y);
    end
end
mask = filter_padding;
% }
[h,w] = size(mask);

P = H + h - 1;
Q = W + w - 1;

img_H = fft2(img,P,Q); % (H, W)
mask_H = fft2(mask,P,Q); % (H, W)
% mask_HH = fft2(mask);

img_H = fftshift(img_H);
mask_H = fftshift(mask_H);
% mask_HH = fftshift(mask_HH);

imshow(log(1 + abs(img_H)),[]);
figure,imshow(log(1 + abs(mask_H)), []);
% figure,imshow(log(1 + abs(mask_HH)), []);

result_H = img_H .* mask_H;
result_H = ifftshift(result_H);
result = ifft2(result_H);
% result = result(2:513,2:513);
figure, imshow(abs(result),[]);

