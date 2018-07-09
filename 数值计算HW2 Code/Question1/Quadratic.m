function [ yi ] = Quadratic( x, y, xi )
%Quadratic interpolation
%   yi=Quadratic(x,y,xi)

    n = max([size(x, 2) size(x, 1)]);
    if n ~= max([size(y, 2) size(y, 1)]) || n < 3
        error('Where there is a wrong in size');
    end
    if (min([size(y, 2) size(y, 1)]) ~= 1 ... 
        || min([size(x, 2) size(x, 1)]) ~= 1)
        error('should be a one dimension matrix');
    end
    
    k = -1;
    pickCondition = x(1) + x(2) + x(3);
    for i = 2:n-1
        if (x(i-1) + x(i) + x(i+1) <= pickCondition)
            k = i;
        end
    end

    if (k == -1) 
        yi = NaN;
    else
        l1 = ((xi-x(k))*(xi-x(k+1)))/((x(k-1)-x(k))*(x(k-1)-x(k+1)));
        l2 = ((xi-x(k-1))*(xi-x(k+1)))/((x(k)-x(k-1))*(x(k)-x(k+1)));
        l3 = ((xi-x(k-1))*(xi-x(k)))/((x(k+1)-x(k-1))*(x(k+1)-x(k)));
        yi = y(k-1) * l1 + y(k) * l2 + y(k+1) * l3;
    end

end

