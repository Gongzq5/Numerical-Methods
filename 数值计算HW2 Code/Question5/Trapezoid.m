function [ result ] = Trapezoid( step_num )
%TRAPEZOID Calculate the quad of [sin(x)/x] in [0, 1]
% 
%   result=Trapezoid(step_num) 
%   @step_num : the num of the example point
    
    f = @(x)((sin(x))./x);

    X = linspace(0, 1, step_num);
    
    sum = 0;
    for i = 2:length(X)
        sum = sum + f(X(i));
    end
    
    T = (f(10e-6) + f(1) + 2*sum)*(1/(step_num * 2));
    
    result = T;
end

