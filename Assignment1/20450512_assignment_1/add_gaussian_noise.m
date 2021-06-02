function noisy_image = add_gaussian_noise(img_input, g_mean, g_std)
    input = double(img_input(:,:,1));
    [m, n] = size(input);
    input = input/255;
    guassian = g_mean + (g_std).*randn(m,n);
    output = guassian + input;
    output = uint8(mat2gray(output) * 255);
    noisy_image = output;
end

