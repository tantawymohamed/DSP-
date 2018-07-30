clear all;
syms k;
%% input signal g(t)=exp(-pi*t^2) ------ > g(f)=exp(-f^2)
fo=.025;
to=1/fo;
ts=.001;
fs=1/ts;
n=-.5*fs:1:.5*fs;
xn = exp (-1*pi.*to.*(n.*ts).^2);    % the signal
%% apply DFT
xk=0;
for n= -.5*fs: .5*fs
xk =xk + xn (n+1+fs/2).* exp (-1 .*1j .*(n .*ts) .*(2 .*pi.*k ./to));
end
%% plot input signal
n= -.5*fs: .5*fs;
figure 
subplot(2,1,1)
bar(n.*ts.*to,xn)
xlabel('Time(s)');ylabel('g(t)');
grid on;
%% plot output
subplot(2,1,2)
k= -1000:1:1000 ;
bar(k./to,subs(xk,k))
xlabel('Frequency (HZ)');ylabel('g(f)');
grid on ;
title ('\color{blue}DFT of signal');