function [ result ] = BetterEuler( )
%BETTEREULER Summary of this function goes here
%   Detailed explanation goes here
    f = @(x,y) y - 2*x/y;
    
    h = 0.1;
    x = 0;
    count = 1;
    y = zeros(1, 10);
    y(1) = 1;
    
    while count <= 10
        y(count+1) = y(count) + h * f(x, y(count));
        
        y(count+1) = y(count) + ...
            (h/2) * (f(x,y(count) + f(x+h, y(count+1))));
        
        x = x + h;
        count = count + 1;      
    end
    
    result = y;
end

