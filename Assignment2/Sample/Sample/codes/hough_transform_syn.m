% hough_transform_syn contains the implementation of main routine for Question
% 2 in Assignment 2. This function uses circular Hough Transform to detect circles
% in a binary image. Given that the radius of the circles is 50 pixels. Note
% that you are not allow to use the imfindcircles matlab built-in function
% in this question.

function hough_transform_syn(IM)

    % Convert the input image to the binary image
    img = im2bw(IM);
    % Display the input image
    figure;
    imshow(img);title('Input image');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % TODO_1: Find the edge of the image
    % imgBW = ??
    imgBW = edge(img);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure;    
    imshow(imgBW);title('Edge');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % TODO_2: Perform the circular Hough Transform. Given that the radius
    % of the circles is 50 pixels. Create a varible 'Accumulator' to store
    % the bin counts.
    % Accumulator = ??
    [m,n] = size(img);
    Accumulator = zeros([m,n], 'uint16');
    r = 50;
    boundaryThickness = 1;
    for x = 1:m
        for y = 1:n
            if imgBW(x,y) == 1
                for i = -r:r
                    for j = -r:r
                        if i^2 + j^2 <= (r+(boundaryThickness-1))^2 && i^2 + j^2 >= (r-(boundaryThickness-1))^2
                            if x+i > 0 && x+i <=m && y+j > 0 && y+j <=n
                                Accumulator(x+i,y+j) = Accumulator(x+i,y+j)+1;
                            end
                        end
                    end
                end
            end
        end
    end
            
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Visualize the Accumulator cells
    figure;
    imagesc(Accumulator);title('Accumulator cells');

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % TODO_3: Search for the highest count cell in 'Accumulator' and store the
    % x,y-coordinate in two separate arrays. Note that there should be 2 sets of x and
    % y-coordinate, ie: x_cir = [{value1};{value2}] , y_cir = [{value1};{value2}]
    % x_cir = ??
    % y_cir = ??
    highestCount = 0;
    x_cir = zeros(1,2,'uint16');
    y_cir = zeros(1,2,'uint16');
    maxNumber = max(max(Accumulator));
    for y = 1:m
        for x = 1:n
            if Accumulator(y,x) == maxNumber
                x_cir(highestCount + 1) = x;
                y_cir(highestCount + 1) = y;
                highestCount = highestCount + 1;
            end
        end
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Plot the results using red line
    figure;
    imshow(imgBW);title('Locate the circles');
    hold on;
    plot(x_cir(:),y_cir(:),'x','LineWidth',2,'Color','red');
    radlist = repmat(50,1,length(x_cir));
    viscircles([x_cir(:) y_cir(:)], radlist(:),'EdgeColor','r');
    %}
    
