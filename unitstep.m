%% convert By DFt : g(t)=u(t) ------>g(f)=delta(f)
syms k;
xn=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];   %The signal
N=length(xn);
%% apply DFT
xk=0;
for n=0:1:N-1
xk =xk + xn (n+1).* exp (-1 .*1j .*n  .* (2*pi*k./N) );
end
%% plot input signal
subplot(2,1,1)
n=0:1:N-1;
bar(n,xn)
xlabel('Time (s)');ylabel('g(t)');
grid on;
%% plot output
subplot(2,1,2)
k= 002:1:10 ;
bar(k./N,subs(xk,k))
xlabel('Frequency (HZ)');ylabel('g(f)');
grid on ;
title ('\color{blue}DFT of signal');
k=0:1:N-1;
bar (k/N, subs(xk,k))