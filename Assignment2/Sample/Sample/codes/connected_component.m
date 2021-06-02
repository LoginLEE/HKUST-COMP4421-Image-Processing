% connected_component.m contains the implementation of the main routine for Question 1 in Assignment 2. 
% This function search for all connected component on the input image. It should output the total number of
% connected components, number of pixels in each connected component and
% display the largest connected component. Note that you are not allow to
% use the bwlabel/bwlabeln/bwconncomp matlab built-in function in this
% question.

function L_CC = connected_component(IM)
    % Convert it to binary image (0,1)
    BW = im2bw(IM);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% TODO_1: Search for all connected component with connectivity equals 
	% to 8 and output the result to the command window in following format:
    % There are total {number of regions} region(s) :
    % Region 1, no. of pixels = {number of pixels}
    % Region 2, no. of pixels = {number of pixels}
    % ...
    
    [m,n] = size(BW);
    temp_map = im2uint8(BW);
    ip_map = zeros(size(BW));
    L_CC = zeros(size(BW));
    count = 254;
    for x = 1:m
        for y = 1:n
            if temp_map(x,  y) == 255
                temp_map(x, y) = count;
                temp_map = spread(temp_map, x, y, count, m, n);
                count = count - 1;
            end
        end
    end
    
    level_map = zeros(1,255,'uint32');
    largestNum = 0;
    largest = 0;
    totalNum = 0;
    for a = 254:-1:1
        for x = 1:m
            for y = 1:n
                if temp_map(x,  y) == a
                    level_map(a) = level_map(a) + 1;
                end
            end
        end
        if level_map(a) > largest
            largest = level_map(a);
            largestNum = a;
        end
        if level_map(a) ~= 0 
            totalNum = totalNum + 1;
        else
            break;
        end
    end
    
    X = ['There are total ', num2str(totalNum) ,' region(s) :'];
    disp(X)
    for a = 1:totalNum
        X = ['Region ', num2str(a), ', no. of pixels = ', num2str(level_map(255-a)) ,':'];
        disp(X)
    end
    
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% TODO_2: Find the largest connected component in binary format (0,1).
	% L_CC = ??
    
    
    for x = 1:m
        for y = 1:n
            if temp_map(x,  y) == largestNum
                L_CC(x,  y) = 1;
            end  
        end
    end
    
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    figure;
    subplot(121);imshow(BW);title('Input image');
    subplot(122);imshow(L_CC);title('Largest connected component');

end