function f = gaussian(size, cutoff) 
    rows = size(1);
    cols = size(2);
    if mod(cols,2)
        xrange = [-(cols-1)/2:(cols-1)/2]/(cols-1);
    else
        xrange = [-cols/2:(cols/2-1)]/cols;
    end
    if mod(rows,2)
        yrange = [-(rows-1)/2:(rows-1)/2]/(rows-1);
    else
        yrange = [-rows/2:(rows/2-1)]/rows;
    end
    [u,v] = meshgrid(xrange,yrange);
    f = 1-exp(-(u.^2+v.^2)./(2*cutoff^2));    
end