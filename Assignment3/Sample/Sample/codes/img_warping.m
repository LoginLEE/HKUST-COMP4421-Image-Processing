function img_warp = img_warping(img, corners, n)

% Implement the image warping to transform the target A4 paper into the
% standard A4-size paper
% Input parameter:
% .    img - original input image
% .    corners - the 4 corners of the target A4 paper detected by the Hough transform
% .    (You can add other input parameters if you need. If you have added
% .    other input parameters, please state for what reasons in the PDF file)
% .    n - determine the size of the result image
% Output parameter:
% .    img_warp - the standard A4-size target paper obtained by image warping

a = zeros(4);
a(1,1) = corners(1);a(1,2) = corners(3);a(1,3) = corners(5);a(1,4) = corners(7);
a(2,1) = corners(2);a(2,2) = corners(4);a(2,3) = corners(6);a(2,4) = corners(8);
a(3,1) = a(1,1)*a(2,1);a(3,2) = a(1,2)*a(2,2);a(3,3) = a(1,3)*a(2,3);a(3,4) = a(1,4)*a(2,4);
a(4,1) = 1;a(4,2) = 1;a(4,3) = 1;a(4,4) = 1;
format shortG
a
I = inv(a);

output_size = [297 * n,210 * n];
output = zeros(output_size);

x1pi=1;x2pi=output_size(1);x3pi=1;x4pi=output_size(1);
y1pi=1;y2pi=1;y3pi=output_size(2);y4pi=output_size(2);

C1 = x1pi * I(1,1) + x2pi * I(2,1) + x3pi * I(3,1) + x4pi * I(4,1);
C2 = x1pi * I(1,2) + x2pi * I(2,2) + x3pi * I(3,2) + x4pi * I(4,2);
C3 = x1pi * I(1,3) + x2pi * I(2,3) + x3pi * I(3,3) + x4pi * I(4,3);
C4 = x1pi * I(1,4) + x2pi * I(2,4) + x3pi * I(3,4) + x4pi * I(4,4);
C5 = y1pi * I(1,1) + y2pi * I(2,1) + y3pi * I(3,1) + y4pi * I(4,1);
C6 = y1pi * I(1,2) + y2pi * I(2,2) + y3pi * I(3,2) + y4pi * I(4,2);
C7 = y1pi * I(1,3) + y2pi * I(2,3) + y3pi * I(3,3) + y4pi * I(4,3);
C8 = y1pi * I(1,4) + y2pi * I(2,4) + y3pi * I(3,4) + y4pi * I(4,4);

C1
C2
C3
C4
C5
C6
C7
C8
%297? ? 210?
targetXY = [0,0];
syms x y




for i = 1:output_size(1)
    i
    for j = 1:output_size(2)
        j
        tx = i;ty = j;
        Eq1= tx == C1*x+C2*y+C3*x*y+C4;
        Eq2= ty == C5*x+C6*y+C7*x*y+C8;
        [X,Y]=vpasolve(Eq1,Eq2,x,y);
        if X(1) > 0 && X(1) < output_size(1) && Y(1) > 0 && Y(1) < output_size(2)
            targetXY(1) = X(1);
            targetXY(2) = Y(1);
        else
            targetXY(1) = X(2);
            targetXY(2) = Y(2);
        end
        output(i,j) = img(round(targetXY(1)),round(targetXY(2)));
    end
end


figure,
imshow(output);title('Edge');