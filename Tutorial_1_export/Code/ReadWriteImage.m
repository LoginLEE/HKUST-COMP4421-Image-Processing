g = imread('Venice.jpg');
%figure,imshow(g);
sg=size(g);
f=rgb2gray(g);

%x = 0:1:255
%y = 2*x.^(1)+0;

%plot(x,y);
%axis([0 255 0 255])
%f = 0.2*f.^(1)+0.5;
%f = f.^(3);
f = f./32;
image(f);
colormap(gray(3));

s = zeros(1,10);
s = uint64(s);
%{
for i = 1:1:445
    for j = 1:1:600
        %f(i, j)
        s(f(i, j)+1) = s(f(i, j)+1) + 1
    end
end
%}
%sum()


sf=size(f);
imwrite(f, 'New1.jpg');
fg=imread( 'New1.jpg');
%figure,imshow(fg);

