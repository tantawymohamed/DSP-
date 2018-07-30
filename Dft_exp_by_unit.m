%% input signal x(t) = exp(-t)* u(t) -----> x(f)=1/(1+j*2*pi*f)
clear all;
syms k;
ts=.05;
to=10;
fo=1/to;
fs=1/ts;
n=0:1:fs;
%input signal 
unitstep =(n.*ts)>=0;
xn = exp(-1*n.*ts.*to).* unitstep;
%% apply DFT
xk=0;
for n= 0 : fs
xk =xk + xn (n+1).* exp (-1 .*1j .*n .* ts .* (2*pi*k./to) );
end

%% plot the input signal 
n= 0 : 1:fs;
bar(n.*ts,xn)
xlabel('Time (sec)');ylabel('g(t)');
grid on ; 
%% plot the result
k =-12*30:1:12*30;
xk_vector(k+12*30+1)=subs(xk,k);
figure 
%real part
subplot(2,2,1)
bar(k./(to),real(xk_vector))
xlabel('freq (hz)');ylabel('Re(g(f))');
grid on ;    
% imaginary part
subplot(2,2,2)
bar(k./to,imag(xk_vector))
xlabel('freq (hz)');ylabel('Im((g(f)))');
grid on ; 

% magnatuide of xk
subplot(2,2,3)
bar(k./to,abs(xk_vector))
xlabel('freq (hz)');ylabel('mag(g(f))');
grid on ; 

% phase of xk
subplot(2,2,4)
bar(k./to,angle(xk_vector))
xlabel('freq (hz)');ylabel('phase((g(f))');
grid on ; 