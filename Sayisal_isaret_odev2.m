%{
clc
clear all;
wc=pi/15;
x=-100:0.01:100; 
y = sin(wc*x)./(pi*x);
plot(x,y)
%}

clc
clear all;
wc = pi/2;
N =100;
n = -N:N;
h = zeros(1,length(n));

for i = 1:length(n)
    h(i) = 2*wc*sinc(1/pi*wc*(i-N-1));    
end

w = linspace(-1,1,2^10)*pi;

X = dtft(h,n,w);
plot(w/pi,abs(X))
xlabel('Freq. in \pi units'), ylabel('X(\omega)')

function y = sinc(x)
y = ones(size(x));
isNonZero = x~=0;
y(isNonZero) = sin(pi*x(isNonZero))./(pi*x(isNonZero));
end

function X = dtft(x,n,w)
X = exp(-1j*(w'*n))*x';
end





