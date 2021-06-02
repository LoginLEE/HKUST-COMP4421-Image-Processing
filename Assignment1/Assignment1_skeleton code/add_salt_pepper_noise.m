function noisy_image = add_salt_pepper_noise(img_input, p)
    input = double(img_input(:,:,1));
    [m, n] = size(input);
    input = input/255;
    S_p = p;
    P_p = p;
    x = rand(m, n);
    output = input;
    output(find(x <= S_p)) = 0;
    output(find(x > S_p & x <(S_p+P_p))) = 1;
    noisy_image = uint8(mat2gray(output) * 255);
end

