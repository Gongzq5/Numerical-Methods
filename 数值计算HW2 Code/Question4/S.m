function [ result ] = S( c, x )
%S Summary of this function goes here
%   Detailed explanation goes here
    
    n = size(c, 2);
    result = 0;
    
    for k = 1:n
        result = result + c(k) * exp(1i * (k-1) * x);
    end
    
end
