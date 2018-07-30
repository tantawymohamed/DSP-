clear all;
syms k;
%%
t=0:.5:5;
impulse = t==5;
%%plot input signal
figure 
N=length(t);
bar(t,impulse)
%%
xn=impulse;
xk=0;
for n= 0 : N-1
xk =xk + xn (n+1).* exp (-1 .*1j .*n.* (2*pi*k./N) );
end
k =0:1:5;
%% plot the result
xk_vector=subs(xk, k);
figure 
%real part
subplot(2,1,1)
bar(k*N,real(xk_vector))
% imaginary part
subplot(2,1,2)
bar(k./N,imag(xk_vector))