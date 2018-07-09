function [ result ] = Secant( initial1 , initial2 )
%SECANT Calculate the value of sqrt(115)

    times = zeros(2, 1000);
    x = zeros(1, 100);
    x(1) = initial1;
    x(2) = initial2;
    k = 2;
    
    tic;
    while k < 100
        x(k+1) = x(k) - ( x(k) ^ 2 - 115 ) / ( x(k) + x(k-1) );
        
        times(1, k) = toc;
        times(2, k) = abs( x(k+1) - x(k));
       
        if (times(2, k) < 10e-6)
            result = x(k+1);
            break;
        end        
        k = k+1;
    end
    
    subplot(1, 2, 1);
    plot(times(1, 2:k), times(2, 2:k), '*-');
    xlabel('time');
    ylabel('error');
    title('Time');
    
    subplot(1, 2, 2);
    plot(1:k-1 , times(2, 2:k), '*-');
    xlabel('step');
    ylabel('error');
    title('Step');
end