function img_result = high_freq_emphasis(img_input, a, b)
    img_input = im2double(img_input);
    s = size(img_input);
    img_input = fftshift(fft2(img_input));
    D0 = 0.1;
    filter = ones(s);
    D0 = (D0) * 127;
    for x=1:s(1)
        for y=1:s(2)
            if ((x-s(1)/2)*(x-s(1)/2) + (y-s(2)/2)*(y-s(2)/2)) <= (D0 * D0)
                filter(x,y) = 0;
            end
        end
    end
    for x=1:s(1)
        for y=1:s(2)
            filter(x,y) = (filter(x,y) * b) + a;
        end
    end
    img_result = img_input .* filter;
    img_result = real(ifft2(ifftshift(img_result)));
end