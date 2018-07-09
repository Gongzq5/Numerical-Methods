function Analyse()
%ANALYSE Summary of this function goes here
%   Detailed explanation goes here
    
    x = [0.32 0.34 0.36 0.38];
    y = [0.314567 0.333487 0.352274 0.370920];
    xi = 0.35;
    
    R = zeros(1, 3);
    R(1) = Linear(x, y, xi);
    R(2) = Quadratic(x, y, xi);
    R(3) = Cubic(x, y, xi);
    
    Real = sin(0.35);
    
    fprintf('\nResult and error in \n')
    fprintf('\n\tLinear \t\t %f, %f\n', R(1), abs(R(1)-Real));
    fprintf('\n\tQuadratic \t %f, %f\n', R(2), abs(R(2)-Real));   
    fprintf('\n\tCubic \t\t %f, %f\n', R(3), abs(R(3)-Real));
    
    plot(1:1:3, R, '-*');
    hold on;
    plot(1:1:3, [Real Real Real]);
    legend('计算结果', '真实值');
end

