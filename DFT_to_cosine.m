%% Get discrete fourier transform "DFT" to cos(wo*t):
%      a)first discrete it by taking samples at n*ts where convert cos(wo*t) to cos(wo*n*ts).
%      b)assume fo=40hz , to=1/fo =.025s , ts=.001s . It means we take 1000 samples.
%      c) last step, put the samples in DFT, xk=sum xn*exp(-j*2*pi*n*k/N).
%      d) plot the input xn and the output xk.
% the final answer is impulse (at k=1,-1) or (fo*k=40,-40).
%% Note: we can replace the cosine ny any function. 
clear all;
syms k;              %make variable k
%% discrete the signal 
ts=.001;
fs=1/ts;               
to=.025; 
fo=1/to;              % period length         
n=0:1:fs;
m=cos(2*pi*(1/to)*n*ts);

%% put the samples in DFT formula
xn=m;
xk=0;
for n=0:1:fs
xk =xk + xn (n+1).* exp (-1 .*1j .*n .* ts .* (2*pi*k./to) );
end

%% plot input 
subplot(2,1,1)
n = 0:1:fs;
bar(n*ts,m)
axis([0 3*to -1.3 1.3]);
xlabel('Time (sec)');ylabel('g(t)');
grid on ; 
title ('\color{blue}the signal');
%% plot output
subplot(2,1,2)
k= -10:1:10 ;
xkk(k+1+10)= subs(xk,k);
bar(k./to,real(xkk (k+1+10))/fs)
xlabel('Frequency (HZ)');ylabel('Re(g(f))');
grid on ;
title ('\color{blue}DFT of signal');