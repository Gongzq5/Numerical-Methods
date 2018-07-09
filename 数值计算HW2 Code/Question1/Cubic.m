function [ yi ] = Cubic( x, y, xi )
%Quadratic interpolation
%   yi=Cubic(x,y,xi)

    n = max([size(x, 2) size(x, 1)]);
    if n ~= max([size(y, 2) size(y, 1)]) || n < 4
        error('Where there is a wrong in size');
    end
    if (min([size(y, 2) size(y, 1)]) ~= 1 ... 
        || min([size(x, 2) size(x, 1)]) ~= 1)
        error('should be a one dimension matrix');
    end
    
    k = -1;
    pickCondition = x(1) + x(2) + x(3) + x(4);
    for i = 2:n-2
        if (x(i-1) + x(i) + x(i+1) + x(i+2) <= pickCondition)
            k = i;
        end
    end
    
    if (k == -1) 
        yi = NaN;
    else
        % k-1
        l1 = ( (xi-x(k)) * (xi-x(k+1)) * (xi-x(k+2)) ) /...
            ( (x(k-1)-x(k)) * (x(k-1)-x(k+1)) * (x(k-1)-x(k+2)) );
        % k
        l2 = ( (xi-x(k-1)) * (xi-x(k+1)) * (xi-x(k+2)) )/...
            ( (x(k)-x(k-1))*(x(k)-x(k+1))*(x(k)-x(k+2)));
        % k+1
        l3 = ((xi-x(k-1))*(xi-x(k))*(xi-x(k+2)))/...
            ((x(k+1)-x(k-1))*(x(k+1)-x(k))*(x(k+1)-x(k+2)));
        % k+2
        l4 = ((xi-x(k-1))*(xi-x(k))*(xi-x(k+1)))/...
            ((x(k+2)-x(k-1))*(x(k+2)-x(k))*(x(k+2)-x(k+1)));
        
        yi = y(k-1) * l1 + y(k) * l2 + y(k+1) * l3 + y(k+2) * l4;
    end

end

