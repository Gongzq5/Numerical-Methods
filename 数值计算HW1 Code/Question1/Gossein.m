function [timeSpan, result] = Gossein(A, b, n)
clear zg k x sum result
zg = [A b];
x = zeros(n,1);

tic;
% for loop to elimination
for k = 1:n
	for i = k+1:n
		m = zg(i,k) / zg(k,k);
		zg(i,:) = -m*zg(k,:) + zg(i,:);
	end
end

b = zg(:,end);
A = zg(:,1:end-1);

x(n,1) = b(n,1)/A(n,n);
for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + (A(i,j)*x(j,1));
    end
    x(i,1) = (b(i,1) - sum)/A(i,i);
end

timeSpan = toc;

result = x;
end