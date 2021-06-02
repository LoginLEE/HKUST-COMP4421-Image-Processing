function img_result = dft_2d(img_input, flag)

% You should include the center shifting in this function
    if strcmp(flag,'DFT')
        img_input = im2double(img_input);
        s = size(img_input);
        A(1:s(1),1:s(2)) = img_input;
        s = size(A);
        for a = 1:s(1)
            for b = 1:s(2)
                A(a,b) = A(a,b)*((-1)^(a+b));
            end
        end
        WM = zeros(s(1),s(1));
        WN = zeros(s(2),s(2));
        for x = 0:s(1)-1
            for u = 0:s(1)-1
            WM(x+1,u+1) = exp(-1j*2*pi*x*u/s(1));
            end
        end
        for y = 0:s(2)-1
            for v = 0:s(2)-1
                WN(y+1,v+1) = exp(-1j*2*pi*y*v/s(2));
            end
        end
        img_result = WM*A*WN;

    elseif strcmp(flag,'IDFT')
        img_input = im2double(img_input);
        s = size(img_input);
        img_result = zeros(s);
        WM = zeros(s(1),s(1));
        WN = zeros(s(2),s(2));
        for x = 0:s(1)-1
            for u = 0:s(1)-1
            WM(x+1,u+1) = exp(1j*2*pi*x*u/s(1));
            end
        end
        for y = 0:s(2)-1
            for v = 0:s(2)-1
                WN(y+1,v+1) = exp(1j*2*pi*y*v/s(2));
            end
        end
        img_result = WM*img_input*WN;
        img_result = real(img_result./(s(1)*s(2)));
        for a = 1:s(1)
            for b = 1:s(2)
                img_result(a,b) = img_result(a,b)*((-1)^(a+b));
            end
        end
    end  

end