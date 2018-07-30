clear all ;
syms n ;
[xt_1, Fs] = wavread('mu.wav');
t= linspace (0,length (xt_1)/Fs,length(xt_1));
plot(t,xt_1)
N = length(xt_1);
k =0:1:N-1;
bar (k, symsum (xt_1(n) .* exp (-1.*1j.*2.*pi.*n.*k./N), n , 0 , N-1))


