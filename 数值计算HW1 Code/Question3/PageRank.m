function [ result ] = PageRank(  )
    tic;
    source = load('source.txt');
    source = source + 1;

    % it don't support index of zero, so we add all by 1
    fromnodes = source(:,1)';
    tonodes = source(:,2)';
    nodesCounts = zeros(1, 80000);
    emptyCount = zeros(1, 80000);
    for i = 1:size(fromnodes,2)
       tmp = fromnodes(1,i); 
       nodesCounts(1,tmp) = nodesCounts(1,tmp) + 1;
    end

    nodesValues = zeros(1, size(fromnodes,2));
    for i = 1:size(fromnodes,2)
        tmp = fromnodes(1, i);
        if nodesCounts(1, tmp) == 0
            nodesValues(i) = 1/75888;
        else
            nodesValues(i) = 1/nodesCounts(1,tmp);
        end
    end
    
    data = sparse(tonodes, fromnodes, nodesValues, 75888, 75888);

    for i = 1:75888
        if nodesCounts(1, i) == 0
            data(i, i) = 1;        
        end
    end
    
    v = sparse(ones(size(data, 2), 1))/size(data,2);
    N = size(data, 1);
    e = ones(1,N)';
    fprintf('will loop %d times\n', size(data,2));
    toc;
    
    result = data;

    beta = 0.15; % teleporting parameter
    times = 1;
    last = v;
    iv = v;
    while times
        iv = (1-beta)*data*iv + e*beta/N;
        if (mod(times, 100) == 0)
            error = norm(iv-last, inf); 
            last = iv;
            if (error < 1e-20) 
                break;
            end
        end
        times = times + 1;
    end
    
    [a, b] = sort(iv, 'descend');
    
    xlswrite('test.xlsx', [a, b]);
    toc;
end

