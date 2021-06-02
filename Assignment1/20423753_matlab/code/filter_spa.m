function img_result = filter_spa(img_input, filter)
    img_input = im2double(img_input);
    s = size(img_input);
    img_result = zeros(s);
    x = (size(filter)-1)/2;
    
    for i = 1+x:s(1)-x
        for j = 1+x:s(2)-x
            temp = img_input(i-x:i+x,j-x:j+x) .* filter;
            img_result(i,j) = sum(temp(:));
        end
    end
%    img_result = mat2gray(img_result);
end