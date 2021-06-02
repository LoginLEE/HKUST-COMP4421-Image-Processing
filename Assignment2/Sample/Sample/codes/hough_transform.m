function [img_marked, corners] = hough_transform(img)

% Implement the Hough transform to detect the target A4 paper
% Input parameter:
% .    img - original input image
% .    (You can add other input parameters if you need. If you have added
% .    other input parameters, please state for what reasons in the PDF file)
% Output parameter:
% .    img_marked - image with marked sides and corners detected by Hough transform
% .    corners - the 4 corners of the target A4 paper

% Remember to print the line functions and the corner points in the command window

angleRange = 10; % This parameter set the angle range of Hough form

angle = angleRange * 90; 
ce = angle / 90;
imgGr = rgb2gray(img);
imgM = imgGr;
[imgG,~] = imgradient(imgM, 'sobel');

imgG = mat2gray(imgG);
imgG = im2bw(imgG,0.15);
imgG = medfilt2(imgG);

[m,n] = size(imgG);
if m > n
    squareImg = zeros(m);
    squareImg(1:m,1:n) = imgG + squareImg(1:m,1:n);
    rho = int32(m*sqrt(2));
elseif n >= m
    squareImg = zeros(n);
    squareImg(1:m,1:n) = imgG + squareImg(1:m,1:n);
    rho = int32(n*sqrt(2));
end

[D,~] = size(squareImg);
accumulator = zeros(sqrt(2) * 2*rho, angle*2+1, 'uint16');

tc = 0;

t = 'float';
r = 'float';

for x = 1:D
    for y = 1:D
        if squareImg(x,y)
            tc = tc +1;
            for t = -angle:1:angle
                r = x * cos(deg2rad(t/ce)) + y * sin(deg2rad(t/ce));
                accumulator(r+sqrt(2)*rho + 1, t+angle+1) = accumulator(r+sqrt(2)*rho + 1, t+angle+1) + 1;
            end
        end
    end
    %x/D
end

WW = 200;
HH = 50;

xCorner = zeros(1,8,'double');
yCorner = zeros(1,8,'double');

for i = 1:8
    mmm = 0;
    max_location = [0,0];
    for t = -angle:1:angle
        for r = -sqrt(2) *rho:1:sqrt(2) *rho - 1
            if accumulator(r+sqrt(2)*rho +1, t+angle+1) > mmm
                mmm = accumulator(r+sqrt(2)*rho, t+angle+1);
                max_location = [r+sqrt(2)*rho, t+angle+1];
            end
        end
    end
    xCorner(i) = max_location(1);
    yCorner(i) = max_location(2);
    
    for q = -WW:1:WW
        for w = -HH:1:HH
            if max_location(1)+q > 0 && max_location(1)+q <= 2*sqrt(2)*rho && max_location(2)+w > 0 && max_location(2)+w <=angle*2+1
                accumulator(max_location(1)+q,max_location(2)+w) = 0;
            end
        end
    end
    
end

xc = zeros(1,8,'double');
cc = zeros(1,8,'double');

fxCorner = zeros(1,8,'double');
fyCorner = zeros(1,8,'double');
fxCorner(1) = xCorner(1);
fyCorner(1) = yCorner(1);

C1 = 1;
C2 = 0;
rr = 5*ce;

c = 2;
for i = 2:8
    if abs(yCorner(i)-fyCorner(1)) < rr && C1 ~= 2
        fxCorner(2) = xCorner(i);
        fyCorner(2) = yCorner(i);
        C1 = C1 + 1;
        c = c + 1;
    elseif ((abs(yCorner(i)-fyCorner(1) - angle)< rr) || (abs(yCorner(i)-fyCorner(1) + angle)< rr))&& C2 ~= 2
        fxCorner(C2+3) = xCorner(i);
        fyCorner(C2+3) = yCorner(i);
        C2 = C2 + 1;
        c = c + 1;
    end
end


xCorner = fxCorner;
yCorner = fyCorner;




b = ce/5+2;

for i = 1:8
    
    if yCorner(i) < b
        yCorner(i) = yCorner(i) + b;
    end
    
    if yCorner(i) > angle - b
        yCorner(i) = yCorner(i) - b;
    end
    
    xc(i) = 1/(-cot((deg2rad((yCorner(i)-angle-1)/ce))));
    cc(i) = -((xCorner(i)-sqrt(2)*rho-1)/sin(deg2rad((yCorner(i)-angle-1)/ce)))/(-cot((deg2rad((yCorner(i)-angle-1)/ce))));
end



finalx = zeros(1:4, 'double');
finalc = zeros(1:4, 'double');

for iiii = 1:4
    finalx(iiii) = xc(iiii);
    finalc(iiii) = cc(iiii);
end

%x1 = (finalc(1)-finalc(3))/(finalx(3)-finalx(1));
%y1 = finalx(1) * x1 + finalc(1);

corners = zeros([2,4]);

for i = 1:2
    for j = 1:2
        corners(1,j+(i-1)*2) = (finalc(i)-finalc(j+2))/(finalx(j+2)-finalx(i));
        corners(2,j+(i-1)*2) = finalx(i) * corners(1,j+(i-1)*2) + finalc(i);
    end
end


for i = 1:4
    X = ['The function of the line ', num2str(i-1), ', is: y = ',num2str(finalx(i)) , ' * x + ', num2str(finalc(i))];
    disp(X);
end

tt = zeros(D, 'uint8');
for z = 1:4
    th(z) = abs(finalx(z))*4 +5;
    for x = 1:D
        for y = 1:D
            if y >= (finalx(z) * x + finalc(z) - th(z)) && y <= (finalx(z) * x +finalc(z) + th(z))
                tt(y,x) = tt(y,x) + 1;
            end
        end
    end
end

[xx,yy] = size(imgG);
mark = zeros([xx,yy]);


for i = 1:xx
    for j = 1:yy
        mark(i,j) = tt(i,j);
        if mark(i,j) ~= 0
            img(i,j,2) = 255;
            img(i,j,1) = 0;
            img(i,j,3) = 0;
        end
    end
end
rrr = 20;
for i = 1:xx
    for j = 1:yy
        for k = 1:4
            if ((i - corners(2,k))^2 + (j - corners(1,k))^2) < rrr^2
                img(i,j,3) = 255;
                img(i,j,1) = 0;
                img(i,j,2) = 0;
            end
        end
    end
end


X = ['The Intersection points are: (', num2str(corners(1,1)), ', ',num2str(corners(2,1)) , ') (', num2str(corners(1,2)), ', ',num2str(corners(2,2)),') (', num2str(corners(1,3)), ', ',num2str(corners(2,3)),') (', num2str(corners(1,4)), ', ',num2str(corners(2,4)),')'];
disp(X)

img_marked = img;

%figure,
%imshow(img);title('Edge');

%figure,
%imshow(mark);title('Edge');

%figure,
%imshow(mat2gray(tt));title('Edge');

corners

%figure,
%imshow(mat2gray(mark));title('Edge');


