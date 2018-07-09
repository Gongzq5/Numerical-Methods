function [ result ] = Simpson( step_num )
%SIMPSON Calculate the quad of [sin(x)/x] in [0, 1]
% 
%   result=Simpson(step_num) 
%   @step_num : the num of the example point

    f = @(x) (sin(x))./x ;
    
    X = linspace(0, 1, step_num);
    h = 1 / step_num;
    
    sum1 = 0;
    for i = 1:length(X)
        sum1 = sum1 + f(X(i)+h/2);
    end
    
    sum2 = 0;
    for i = 2:length(X)
        sum2 = sum2 + f(X(i));
    end
    
    S = (h/6) * ( f(10e-6) + 4 * sum1 + 2 * sum2 + f(1) );
    
    result = S;
end

