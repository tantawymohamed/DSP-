%% Get discrete fourier transform "DFT" to cos(wo*t):
%      a)first discrete it by taking samples at n*ts where convert cos(wo*t) to cos(wo*n*ts).
%      b)assume fo=10 , to=1/fo =.1 , ts=.01 . It means we take 10 samples(N=ts/to).
%      c) last step, put the samples in DFT, xk=sum xn*exp(-j*2*pi*n*k/N).
%      d) plot the input xn and the output xk.
% the final answer is impulse (at k=1,9) or (n/k=10,10/9).
%% Note: we can replace the cosine ny any function. 
clear all;
syms k;              %make variable k
%% discrete the signal 
rect=@(x,a) ones(1,numel(x)).*(abs(x)<a/2); % a is the width of the pulse
x=-0.5:0.001:1;
y=rect(x,2) ;  
plot(x,y)
ts=.001;               
to=.2; 
fo=1/to;              % period length 
N = to/ts;           %number of samples
n=-.5*N:1:N/2;
m=rect(n.*ts,.2) ; 
%% put the samples in DFT formula
xn=m;
xk=0;
for n= -.5*N:1: N/2
xk =xk + xn (n+1+N/2).* exp (-1 .*1j .*2 .*pi .*n .*k ./N);
end

%% plot input 
subplot(2,1,1)
n=-.5*N:1:N/2;
bar(n.*ts,m)
xlabel('Time (sec)');ylabel('g(t)');
grid on ; 
title ('\color{blue}the signal');

%% plot output
subplot(2,1,2)
k =-.5*N:1:N/2;
xkk=subs(xk, k)
bar(k.*fo./N,real(xkk))
xlabel('Frequency (HZ)');ylabel('Magnatuide');
grid on ;
title ('\color{blue}DFT of signal');