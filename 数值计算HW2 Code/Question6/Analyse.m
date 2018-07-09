function Analyse( )
%ANALYSE Summary of this function goes here
%   Detailed explanation goes here
    
    f = @(x) sqrt(1+2*x);
    
    Real = f(0:0.1:1);
    FE = ForwardEuler();
    BE = BackwardEuler();
    T = Trap();
    BEE = BetterEuler();
    
    figure(1);
    plot(0:0.1:1, Real, '*-');
    hold on;
    plot(0:0.1:1, FE, '*-');
    hold on;
    plot(0:0.1:1, BE, '*-');
    hold on;
    plot(0:0.1:1, T, '*-');
    hold on;
    plot(0:0.1:1, BEE, '*-');
    hold on;
    title('Analyse');
    legend('True', 'Forward', 'Backward', 'Trap', 'Better Euler');
    
    figure(2);
    plot(0:0.1:1, abs(FE-Real), '*-');
    hold on;
    plot(0:0.1:1, abs(BE-Real), '*-');
    hold on;
    plot(0:0.1:1, abs(T-Real), '*-');
    hold on;
    plot(0:0.1:1, abs(BEE-Real), '*-');
    hold on;
    title('Analyse');
    legend('Forward', 'Backward', 'Trap', 'Better Euler');
end

