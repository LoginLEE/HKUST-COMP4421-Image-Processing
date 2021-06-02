function A = spread(A,i,j,id, max_x, max_y)
   
    %A
    
    if(i+1 <= max_x && i+1 >0 && j <= max_y && j > 0)
        if A(i+1, j) == 255
            A(i+1, j) = id;
            A = spread(A,i+1,j,id,max_x,max_y);
        end
    end
    
    if(i-1 <= max_x && i-1 >0 && j <= max_y && j > 0)
        if A(i-1, j) == 255
            A(i-1, j) = id;
            A = spread(A,i-1,j,id,max_x,max_y);
        end
    end
    
    if(i <= max_x && i >0 && j+1 <= max_y && j+1 > 0)
        if A(i, j+1) == 255
            A(i, j+1) = id;
            A = spread(A,i,j+1,id,max_x,max_y);
        end
    end
    
    if(i <= max_x && i >0 && j-1 <= max_y && j-1 > 0)
        if A(i, j-1) == 255
            A(i, j-1) = id;
            A = spread(A,i,j-1,id,max_x,max_y);
        end
    end
    
    if(i+1 <= max_x && i+1 >0 && j+1 <= max_y && j+1 > 0)
        if A(i+1, j+1) == 255
            A(i+1, j+1) = id;
            A = spread(A,i+1,j+1,id,max_x,max_y);
        end
    end
    
    if(i-1 <= max_x && i-1 >0 && j-1 <= max_y && j-1 > 0)
        if A(i-1, j-1) == 255
            A(i-1, j-1) = id;
            A = spread(A,i-1,j-1,id,max_x,max_y);
        end
    end
    
    if(i-1 <= max_x && i-1 >0 && j+1 <= max_y && j+1 > 0)
        if A(i-1, j+1) == 255
            A(i-1, j+1) = id;
            A = spread(A,i-1,j+1,id,max_x,max_y);
        end
    end
    
    if(i+1 <= max_x && i+1 >=0 && j-1 <= max_y && j-1 > 0)
        if A(i+1, j-1) == 255
            A(i+1, j-1) = id;
            A = spread(A,i+1,j-1,id,max_x,max_y);
        end
    end

end