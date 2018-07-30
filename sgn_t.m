%% input signal g(t)= sgn(t)------> g(f)=1/(j*pi*f)
clear all;
syms k;
%% The signal in Time domain
ts=.001;
to=5;
fs=1/ts;
n=-fs:1:fs;
xn= sign(n*ts*to);
%% apply DFT
xk=0;
for n= -1*fs: fs
xk =xk + xn (n+1+fs).* exp (-1 .*1j .*(n .* ts) .* (2*pi*k./to) );
end
%% plot the input
n=-fs:1:fs;
figure
bar(n.*ts*to,xn)
xlabel('Time (sec)');ylabel('g(t)');
grid on ; 
title ('\color{blue}the signal');
%% plot the result
k=0:1:100;
xk_vector(k+1)=subs(xk, k);
figure 

% Imaginary of xk
subplot(2,1,1)
bar(k ./to,imag(xk_vector))
xlabel('Frequency (HZ)');ylabel('Im(g(f))');
grid on ;

% Real of xk
subplot(2,1,2)
bar(k ./to,real(xk_vector))
xlabel('Frequency (HZ)');ylabel('Re(g(f))');
grid on ;