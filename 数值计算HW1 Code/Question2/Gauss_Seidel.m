function [ result, errors, timeUse ] = Gauss_Seidel( A, b )

n = size(A, 1);
errors = zeros(1, 1);

x = zeros(n, 1);
last = x;

tic;

timeUse = 1;

while timeUse
    for i = 1:n
        sum = 0;
        for j = 1:n
            if (j == i)
                continue;
            end
            sum = sum + A(i,j)*x(j,1);
        end
        x(i,1) = (b(i,1) - sum) / A(i,i);
    end
    errors(1,timeUse) = norm(last-x, 'inf');
    last = x;
    if errors(1,timeUse) < 10e-6
        break;
    end
    timeUse = timeUse + 1;
end

timeSpan = toc;

result = x;
end
