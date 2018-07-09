function [] = SORRunner()
%SORRUNNER Summary of this function goes here
%   Detailed explanation goes here
    
for N = [10 50 100 200]
    
    while 1
        brk = 1;
        D = diag(rand(N,1));
        U = orth(rand(N,N));
        A = U' * D * U;
       
        D = triu(A) + tril(A) - A;
        b = randn(N, 1);
        tmp = eig(2 * D - A);
        for i = 1:N
            if tmp(i) < 0
                brk = 0;
            end
        end
        if brk == 1
            break;
        end
    end
    
    for w = 0.5:0.1:1.5
        [ result, errors, timeUse ] = SOR(A, b, w);
        
        if N == 10
            pos = 1;
        elseif N == 50
            pos = 2;
        elseif N == 100
            pos = 3;
        else
            pos = 4;
        end
        
        subplot(2,2,pos), plot(1:size(errors,2), errors);
        title(['SOR with N ' num2str(N)]);
        xlabel('µü´ú´ÎÊý');
        ylabel('Îó²î');
        hold on;
    end
    
    legend('w=0.5','w=0.6','w=0.7','w=0.8','w=0.9','w=1.0','w=1.1','w=1.2','w=1.3','w=1.4','w=1.5');
    
    hold off;
    fprintf('N is %d\n', N);
end



end

