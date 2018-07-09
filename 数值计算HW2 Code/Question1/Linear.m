function [ yi ] = Linear( x, y, xi )
%LINEAR interpolation
%   yi=Linear(x,y,xi)
    
    n = max([size(x, 2) size(x, 1)]);
    if n ~= max([size(y, 2) size(y, 1)])
        error('Where there is a wrong in size');
    end
    if (min([size(y, 2) size(y, 1)]) ~= 1 ... 
        || min([size(x, 2) size(x, 1)]) ~= 1)
        error('should be a one dimension matrix');
    end
    
    pos = -1;
    for i = 1:n-1
        if (x(i) <= xi && x(i+1) >= xi) 
            pos = i;
        end
    end
    
    if (pos == -1) 
        yi = NaN;
    else
        l1 = (xi - x(pos+1)) / (x(pos) - x(pos+1));
        l2 = (xi - x(pos)) / (x(pos+1) - x(pos));
        yi = y(pos) * l1 + y(pos+1) * l2;
    end
end
