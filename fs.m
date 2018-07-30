%% Get fourier series "F.S" to rectangular pulse train =(1 (from 0 to To/2) )&&(0 (from To/2 to To))
%% To get F.S to another function  change coeiffients of F.S

syms n;    
syms t ;    %variables n,t
n=1:1:15;
To=2;       % period to one cycle

%% Get coeiffients of F.S 
ao =(1/To) *int(1 ,t,0,1);                       %general: %ao=(1/To) *int(ft ,t,0,To); 
an =(2/To) *int(cos(n*2*pi*t/To),t,0,To/2);                %an =(2/To) *int(ft*cos(n*2*pi*t/To),t,0,To);
bn =(2/To) *int(sin(n*2*pi*t/To),t,0,To/2);                %bn =(2/To) *int(ft*sin(n*2*pi*t/To),t,0,To); 
 
%%combine coeiffients in fourier series form
ft=an.*cos(n.*2.*pi.*t./To)+ bn.*sin(n.*2.*pi.*t./To);
 
ft_ao=ao;
i=1;
for i=1:5 
    ft_ao=ft_ao+ft(i);
end

%% plot the signal in time domain
figure
subplot(2,2,1);

%%% plot x axis line and y axis line 
x=0:.01:2;
y=0*x; 
plot(x,y ,'R --')
hold on;
y=-.5:.01:1.5;
x=0*y;
plot(x,y, 'R --')
hold on ;

%orignal signal "rectangular pulse train"
x = 0 : 1/1e3 : 2;         % 1 kHz sample freq for 1 sec 
d = 0 : 2 : 2;             % .5 Hz repetition freq 
y = pulstran(x-.5,d,'rectpuls',1);
plot(x,y)
hold on ;

%The signal by fourier series
t=0:.00001:2;  
plot(t, subs(ft_ao))
xlabel('Time (sec)');ylabel('g(t)');
grid on ; 
title ('the signal');

%%
%%plot spectrum of the signal
subplot(2,2,2);
bar (n/To, sqrt(an.^2+bn.^2),.05)
xlabel('Frequency (HZ)');ylabel('Magnatuide');
grid on ;
title ('spectrum of signal');