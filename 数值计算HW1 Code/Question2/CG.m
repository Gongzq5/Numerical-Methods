function [ result, errors, timeUse ] = CG( A, b )

%CG Summary of this function goes here
%   Detailed explanation goes here
n = size(A, 1);
x = zeros(n, 1);
errors = zeros(1, 1);
tic;

rk = b - A*x;   % it is the r(k)

pk = rk;

timeUse = 1;
last = x;
while timeUse
    alpha = dot(rk, rk) / dot(pk, A*pk);
    
    x = x + alpha * pk;
    rk1 = rk - alpha * A * pk;
    beta = dot(rk1, rk1) / dot(rk, rk);
    
    pk = rk1 + beta * pk;
    
    rk = rk1;
    
    errors(1, timeUse) = norm(last-x, 'inf');
        last = x;
    if errors(1,timeUse) < 10e-6
        break;
    end
    timeUse = timeUse + 1; 
end

timeSpan = toc;

result = x;

end

