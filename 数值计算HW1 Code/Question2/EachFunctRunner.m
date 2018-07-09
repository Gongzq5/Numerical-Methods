function [] = EachFunctRunner()
%EACHFUNCTRUNNER You can replace 'Jocobi', 'Gauss_Seidel' or 'CG' in this
%function to get an analyse.

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
    
    [result, errors, timeUse] = CG(A, b);
    
    plot(1:timeUse, errors);
    title('CGÎó²î');
    xlabel('µü´ú²½Êý');
    ylabel('Îó²î');
    hold on;
end

legend('N=10', 'N=50', 'N=100', 'N=200');

end

