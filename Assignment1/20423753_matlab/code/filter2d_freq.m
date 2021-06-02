function img_result = filter2d_freq(img_input, filter)
    img_input = im2double(img_input);
    s = size(img_input);
    A = zeros(2*s(1),2*s(2));
    A(1:s(1),1:s(2)) = img_input;

    fs = size(filter);
    F = zeros(2*s(1),2*s(2));
    F(1:fs(1),1:fs(2)) = filter;
    
    Adft = dft_2d(A,'DFT');
    Fdft = dft_2d(F,'DFT');
    
    result = Adft.*Fdft;
    
    img_result = dft_2d(result,'IDFT');
    
    img_result = img_result(1:s(1),1:s(2));
end

