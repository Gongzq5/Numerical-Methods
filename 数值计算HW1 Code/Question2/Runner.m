function Runner()
%RUNNER Summary of this function goes here
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
    
    [resultJ, errorsJ, timeUseJ] = Jocobi(A, b);
    [resultG, errorsG, timeUseG] = Gauss_Seidel(A,b);
    [resultC, errorsC, timeUseC] = CG(A, b);
    
    plot(1:1:3, [timeUseJ, timeUseG, timeUseC], '*-');
    title('同一误差限迭代次数'); 
    hold on;
end

legend('N=10','N=50','N=100','N=200');

end