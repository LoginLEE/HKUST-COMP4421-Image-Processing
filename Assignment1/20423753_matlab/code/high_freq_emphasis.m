function img_result = high_freq_emphasis(img_input, a, b, type)
    F = dft_2d(img_input,'DFT');
    s = size(F);
    cutoff = 0.1;
    n = 1;
    if strcmp(type,'butterworth')
        H = a + b.*butterworth(s,cutoff,n);
    elseif strcmp(type,'gaussian')
        H = a + b.*gaussian(s,cutoff);
    end
    img_result = F.*H;
    img_result = dft_2d(img_result,'IDFT');

%     img_input = dft_2d(img_input,'DFT');
%     if strcmp(type,'butterworth')
%         img_result = img_input .* (a+b.*butterworth(size(img_input),0.1,1));
%         img_result = real(img_result);
%     end
%     if strcmp(type,'gaussian')
%         img_result = img_input .* (a+b.*gaussian(size(img_input),0.1));
%         img_result = dft_2d(img_result,'IDFT');
%         img_result=real(img_result);
%     end
end