function Analyse( )
%ANALYSE Summary of this function goes here
%   Detailed explanation goes here

    Fs = 1024; 
    N = 1024; 
    t = 0:1/Fs:N/Fs; 
    t = t(1:N);
    
    S=2+2*sin(2*pi*2*t)+4*sin(2*pi*3*t)+...
        sin(2*pi*50*t)+5*sin(2*pi*75*t);
    
    result = FFT_1024(S);
    
    figure(1);
    plot(linspace(1, Fs, N) , S);
    title('Ô­Ê¼Í¼Ïñ');
    
    figure(2);
    plot(linspace(1, Fs, N), abs(result));
    title('ÆµÓò');
    
end

