syms k;
%% convert By DFt : g(t)=delta(t) ------>g(f)=u(f)
xn=1;             %the signal
N=length(xn);
%% apply DFT
xk=0;
for n=0:1:N-1
xk =xk + xn (n+1).* exp (-1 .*1j .*n  .* (2*pi*k./N) );
end
%% plot output
k=0:1:10;
xk_vector(k+1)=subs(xk,k);
bar (k./N, xk_vector(k+1))
xlabel('Frequency (HZ)');ylabel('g(f)');
grid on ;
title ('\color{blue}DFT of signal');