clear all;
syms k;
%% input signal " Here, it is exp(2*pi*fo*t)" but to make it discrete replace t by n*ts
fo=100;
to=1/fo;
ts=.001;
fs=1/ts ;
n=0:1:fs;
xn = exp (-1i*2*pi.*fo.*n.*ts);
%% plot input signal
figure  
%real part
subplot(2,1,1)
bar(n*ts,xn)
title ('\color{blue} The signal in TD');
xlabel('time(sec)');ylabel('real part in f(t)');
grid on ;

subplot(2,1,2)
bar(n*ts,imag(xn))
xlabel('time(sec)');ylabel('imaginary part in f(t)');
grid on ;
%% apply DFT
xk=0;
for n= 0 : fs
xk =xk + xn (n+1).* exp (-1 .*1j .*(n .*ts).*(2 .*pi.*k .*fo));
end
k =1:1:5;

%% plot the result
xk_vector(k)=subs(xk, k);
figure 
title ('\color{blue} DFT of signal');
%real part
subplot(2,1,1)
bar(k./to,real(xk_vector(k))/fs)
xlabel('Frequency (HZ)');ylabel('real part');
grid on ;

% imaginary part
subplot(2,1,2)
bar(k./to,imag(xk_vector))
xlabel('Frequency (HZ)');ylabel('imaginary part');
grid on ;