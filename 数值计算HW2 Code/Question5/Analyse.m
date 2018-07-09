function Analyse()
%Analyse Summary of this function goes here
%   Detailed explanation goes here
    
    T_r = zeros(1, 4);
    S_r = zeros(1, 4);
    
    f = @(x) sin(x)./x;    
    Real = integral(f, 0, 1) * ones(1, 4);
    
    step_ar = [5 9 17 33];
    
    for i = 1:4
        T_r(i) = Trapezoid(step_ar(i));
        S_r(i) = Simpson(step_ar(i));
    end
    
    plot(step_ar, abs(T_r - Real), '*-');
    hold on;
    plot(step_ar, abs(S_r - Real), '*-');
    hold on;
    legend('Trapezoid', 'Simpson');
end
