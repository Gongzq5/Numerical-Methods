function [ result ] = ForwardEuler(  )
%FORWARDEULER Summary of this function goes here
%   Detailed explanation goes here
    
    h = 0.1;
    x = 0;
    count = 1;
    y = zeros(1, 10);
    y(1) = 1;
    
    while count <= 10
        y(count+1) = y(count) + h * (y(count) - 2 * x / y(count));
        x = x + h;
        count = count + 1;
    end
    
     result = y;
%     plot(0:0.1:1, result);
%     hold on;
%     ezplot('y=sqrt(1+2*x)', [0 1 1 2]);
%     legend('Euler', 'True result');
end

