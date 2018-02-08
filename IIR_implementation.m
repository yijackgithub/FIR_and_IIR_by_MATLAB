clc; clear all; close all;
n = 6;m = 6;
num = [0.3132,0.3816,0.09881,0.1696,0.09371,0.0007602];
den = [1 0.1205 0.3412 0.4487 0.3888 -0.02804 1.67e-5];

u_ff = zeros(1,n);
y_fb = zeros(1,m);
L = 1000;
u = sin(2*pi*1*(1:L)/L);
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