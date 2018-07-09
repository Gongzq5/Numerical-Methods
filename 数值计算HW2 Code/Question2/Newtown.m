function [ result ] = Newtown( initial )
%NEWTOWN Calculate the value of sqrt(115)

    Real = sqrt(115);
    
    x = zeros(1, 1000);
    x(1) = initial;
    k = 1;
    times = zeros(1, 1000);
    errors = zeros(1, 1000);
    
    tic;
    while k < 1000
        x(k+1) = x(k) - ( x(k) ^ 2 - 115 ) / (2 * x(k));
        
        errors(k) = x(k+1) - x(k);
        times(k) = toc;
        if (abs(errors(k)) < 10e-6) 
            result = x(k+1);
            break;
        end
        k = k+1;
    end
    
    disp(k);
    k = k - 1;
    
    subplot(1, 2, 1);
    plot(1:k+1, abs(errors(1:k+1)), '*-');
    title('step');
    
    subplot(1, 2, 2);
    plot(times(1:k+1), abs(errors(1:k+1)), '*-');
    title('time');
end

