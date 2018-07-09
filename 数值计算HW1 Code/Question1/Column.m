function [timeSpan, result] = Column(A, b, n)
clear zg k x sum result m

tic;

zg = [A b];
x = zeros(n,1);

for k = 1:1:n-1
    maxColumn = k;
    for i = k:n
        if abs(A(maxColumn,k)) < abs(A(i,k))
            maxColumn = i;
        end
    end
    
    if A(k,k) == 0
        fprintf('Calculate determined\n');
        return;
    elseif maxColumn ~= k
        tmp = zg(maxColumn,:);
        zg(maxColumn,:) = zg(k,:);
        zg(k,:) = tmp;
        % swap line    
    end
    
    for i = k+1:n
		m = zg(i,k) / zg(k,k);
		zg(i,:) = -m*zg(k,:) + zg(i,:);
    end
end

if A(n,n) == 0
    fprintf('Calculate determined\n');
    return;
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