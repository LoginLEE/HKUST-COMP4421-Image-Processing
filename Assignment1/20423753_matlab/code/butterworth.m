function f = butterworth(size, cutoff, n)
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
    [x,y] = meshgrid(xrange,yrange);
    radius = sqrt(x.^2+y.^2);
    f = 1.0./(1.0+(cutoff./radius).^(2*n));

%     xrange = [-floor(size(1)/2):floor(size(1)-1)/2]/size(1);
%     yrange = [-floor(size(2)/2):floor(size(2)-1)/2]/size(2);
%     [u,v] = meshgrid(xrange,yrange);
%     f = 1./((1.+cutoff./sqrt(u.^2+v.^2)).^(2*n));
end
