function img_result = lowpass_filter(img_input,D0)
    img_input = im2double(img_input);
    s = size(img_input);
    img_input = fftshift(fft2(img_input));
    filter = zeros(s);
    D0 = D0 * 127;
    for x=1:s(1)
        for y=1:s(2)
            if ((x-s(1)/2)*(x-s(1)/2) + (y-s(2)/2)*(y-s(2)/2)) <= (D0 * D0)
                filter(x,y) = 1;
            end
        end
    end
    img_result = img_input .* filter;
    img_result = real(ifft2(ifftshift(img_result)));
end

