function xk = DFT (xn)
    N = length(xn);
    xk = zeros(1,N);
    for k = 1:N
        for n=1:N
            xk(k) = xk(k)+xn(n)*exp(-2*1i*pi*(n-1)*(k-1)/N);
        end
    end
end


% function [result] = Calculate(N, y, W)
%     w = @(j,k,N) (exp(1)^(i*2*pi*j*k/N));
%     
%     N = N + 1;
%     if (N == 1) 
%         sum = 0;
%         for j = 1:N-1
%             sum = sum + 
%         end
%     end
%     
%     result = c;
% end

