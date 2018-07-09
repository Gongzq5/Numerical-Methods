function [ result ] = FFT_1024( x )
%FFT Summary of this function goes here
%   Detailed explanation goes here
    
    N = size(x, 2);
    if (N ~= 1024) 
        x(1, N+1:1024) = zeros(1, 1024-N);
    end
    N = 1024;

    p = log2(N); % N = 2^p     
    A = zeros(p+1, N);
    
    A(1, :) = x;
    
    w = @(a) exp(-1i * 2 * pi * a / N);
    
    for q = 1:p
        for k = 0:2^(p-q)-1
            for j = 0:2^(q-1)-1
                A(q+1, k*2^q+j+1) = ...
                    A(q, k*2^(q-1)+j+1) + ...
                    A(q, k*2^(q-1)+j+2^(p-1)+1);
                
                A(q+1, k*2^q+j+2^(q-1)+1) = ...
                    (A(q, k*2^(q-1)+j+1) - ...
                    A(q, k*2^(q-1)+j+2^(p-1)+1)) *...
                    w(k*2^(q-1));
            end
        end
    end
    
    result = A(end, :);    
end

