clear;
narray = [10 50 100 200];
errorTestTimes = 4;
errorg = zeros(1,errorTestTimes);
errorc = zeros(1,errorTestTimes);
gt = zeros(1,errorTestTimes);
ct = zeros(1,errorTestTimes);

for n = 1:errorTestTimes
    A = (randn(narray(1,n))+3).*100;
    b = (randn(narray(1,n),1)+3).*100;
    correctResult = A\b;
    
    [gt(n), resg] = Gossein(A, b, narray(1,n));
    [ct(n), resc] = Column(A, b, narray(1,n));
end

figure(1);

plot(narray, gt, 'b^-');
hold on;
plot(narray, ct, 'r^-');
hold on;
title('Gaussian Elimination Time Analyse');
grid on;
legend('Gossein', 'Column');
hold off;

