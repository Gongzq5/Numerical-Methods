function [ result ] = Bisection()
%BISECTION Calulate the sqrt(115) by bisection method

    i_begin = 10;
    i_end = 11;
    
    i_begin_value = i_begin ^ 2 - 115;
    i_end_value = i_end ^ 2 - 115;
    
    Real = sqrt(115);
    
    times = zeros(2, 1000);
    count = 1;
    
    tic;
    while true
        mid = (i_begin + i_end) / 2;
        mid_value = mid ^ 2 - 115;
        
        if (abs(i_end - i_begin) < 10e-6)
            result = mid;            
            break;
        elseif (mid_value * i_begin_value < 0) 
            i_end = mid;
        elseif (mid_value * i_end_value < 0)
            i_begin = mid;
        else
            break;
        end
        
        i_begin_value = i_begin ^ 2 - 115;
        i_end_value = i_end ^ 2 - 115;
        
        times(1, count) = toc;
        times(2, count) = abs(i_end - i_begin);
        
        count = count + 1;
    end
    
    count = count - 1;
    subplot(1, 2, 1);
    plot(times(1, 1:count), times(2, 1:count), '*-');
    xlabel('time');
    ylabel('error');
    title('Time');
    
    subplot(1, 2, 2);
    plot(1:count , times(2, 1:count), '*-');
    xlabel('step');
    ylabel('error');
    title('Step');
    
end

