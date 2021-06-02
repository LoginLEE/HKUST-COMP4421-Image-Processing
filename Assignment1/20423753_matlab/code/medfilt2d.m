function img_result = medfilt2d(img_input, sz)
    img_input = im2double(img_input);
    s = size(img_input);
    img_result = zeros(s);
    x = (sz-1)/2;
    
    for i = 1+x:s(1)-x
        for j = 1+x:s(2)-x
            temp = img_input(i-x:i+x,j-x:j+x);
            temp2 = temp(:);
            img_result(i,j) = median(temp2);
        end
    end
end
            