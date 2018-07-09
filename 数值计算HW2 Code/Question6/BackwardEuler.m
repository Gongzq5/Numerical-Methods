function [ result ] = BackwardEuler( )
%BACKWARDEULER Summary of this function goes here
%   Detailed explanation goes here

% y(count+1) = y(count) + h * (y(count) - 2 * x / y(count));
    f = @(x,y) y - 2*x/y;
    
    h = 0.1;
    x = 0;
    count = 1;
    y = zeros(1, 10);
    y(1) = 1;
    
    while count <= 10
        y(count+1) = y(count);
        
        while true
            last = y(count+1);
            y(count+1) = y(count) + h * (f(x+h, y(count+1)));
            if y(count+1) - last < 10e-8
                break;
            end
        end
  
        x = x + h;
        count = count + 1;
       
    end
    
    result = y;
end
