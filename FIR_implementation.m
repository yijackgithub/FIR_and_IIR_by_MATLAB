clc; clear all; close all;
n = 7;m = 7;
num = [0.01 0.25 0.5 1 0.5 0.25 0.01];
den = [1,zeros(1,7)];

u_ff = zeros(1,n);
y_fb = zeros(1,m);
L = 50000;
u = sin(2*pi*1000*(1:L)/L);
y_v = zeros(1,L);
y = 0;

for i = 1:L
    y = sum(u_ff.*num)-sum(y_fb.*den(2:end));
    u_ff = [u(i), u_ff(1:n-1)];
    y_fb= [y, y_fb(1:m-1)];
    y_v(i) = y;
end

y = filter(num,den,u);
plot(y_v); hold on; plot(y,'r');

%%
