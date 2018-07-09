function [ result ] = RLS( A, b )
%RLS Summary of this function goes here
%   b = Ax
%   A is 10000 * 10 matrix
%   b is 10000 * 1 matrix
%   x will be a 1 * 10 matrix
    
    
%	A = randn(10000, 10); b = randn(10000, 1);

    m = size(A, 1); % expect to be 10000
    n = size(A, 2); % expect to be 10

    a = zeros(n, m);

    errors = zeros(1, m);
    
    % 以前n=10个作为初值，用批处理算法得到初始a    
    phi = A(1:n, 1:n);
    a(:, n) = inv((phi') * (phi)) * phi' * b(1:n, 1);
    % a(:, n) = phi \ b(1:n, 1);
    P_1 = inv( phi' * phi );

    for k = n+1 : m
        phi_m = (A(k, :))';
        K = (P_1 * phi_m) / (1 + phi_m' * P_1 * phi_m);
        P = ((eye(size(K,1))) - K * phi_m') * P_1;
        P = (P + P') / 2;
        a(:, k) = a(:, k-1) + K * (b(k, 1) - phi_m' * a(:, k-1));        
        
        errors(1, k - n) = norm(P-P_1, 2);
        
        P_1 = P;
    end
    
    result = a(:, m);
    figure(1);
    plot(1:100, errors(1:100));
    
    figure(2);
    plot(1:m, errors(1:m));
end
