%% Get discrete fourier transform "DFT" to sin(wo*t):
%      a)first discrete it by taking samples at n*ts where convert cos(wo*t) to cos(wo*n*ts).
%      b)assume fo=40hz , to=1/fo =.025s , ts=.001s . It means we take 100 samples.
%      c) last step, put the samples in DFT, xk=sum xn*exp(-j*2*pi*n*k/N).
%      d) plot the input xn and the output xk.
% the final answer is impulse (at k=1,-1) or (k/to=40,-40).
% I check the code with other freq like .5hz , 4hz ....etc.
%% Note: we can replace the sine ny any function. 
clear all;
syms k;              %make variable k
%% discrete the signal 
ts=.001;               
fs=1/ts;               %sampling freq
to=.025;
fo=1/to;               % period length 
n= 0:1:fs;
m=sin(2*pi*fo*n*ts);    %the signal

%% apply DFT formula
xn=m;
xk=0;
for n= 0: fs
xk =xk + xn (n+1).* exp (-1 .*1j .*(n.*ts) .*(2 .*pi .*k ./to));
end

%% plot the input signal
subplot(2,1,1)
n=0:1:fs;
bar(n*ts,m)
xlabel('Time (sec)');ylabel('g(t)');
grid on; 
title ('\color{blue}the signal');

%% plot the output signal
subplot(2,1,2)
k =-10:1:10;
xk_vector=subs(xk, k);
bar(k./to,abs(xk_vector))
xlabel('Frequency" (HZ)');ylabel('|g(f)|');
grid on ;
title ('\color{blue}DFT of signal');

