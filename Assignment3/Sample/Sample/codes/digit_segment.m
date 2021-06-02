function [digits_set] = digit_segment(img)

% Implement the digit segmentation
% img: input image
% digits_set: a matrix that stores the segmented digits. The number of rows
%            equal to the number of digits in the iuput image. Each digit 
%            is stored in each row. Please make sure the segmented digit is a sqaure
%            image before expand it into a row vector.