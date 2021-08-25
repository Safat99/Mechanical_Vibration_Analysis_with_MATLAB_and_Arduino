close all;
clear all;
clc;

%{
% Fs = 58.34306;
Fs = 150;
Ts = 1/Fs;
dt = 0:Ts:2-Ts;

y1 = 10*sin(2*pi*10*dt);
y2 = 10*sin(2*pi*30*dt);
y3 = 10*sin(2*pi*70*dt);
y4 = y1 + y2 + y3;
% y4 = 0 * dt + 3;

nfft = length(y4);
nfft2 = 2^nextpow2(nfft); % length of signal in power of 2
ff = fft(y4,nfft2);
fff = ff(1:nfft2/2);
xfft = Fs*(0:nfft2/2-1)/nfft2;
plot(xfft,abs(fff));
title('after fft to huddai');
%}



 T = readtable('frst_test2.csv');
% T = readtable('last1000.csv');
% T = readtable('3rd_test.csv');
 %T = readtable('4th_test.csv');



T = table2array(T);
front_time = T(:,1);
raw_x = T(:,6);
raw_back_x = T(:,2);
raw_back_y = T(:,3);
raw_back_z = T(:,4);
raw_y = T(:,7);
raw_z = T(:,8);
plot(front_time,raw_x);
raw_x = raw_x.';
raw_y = raw_y.';
raw_z = raw_z.';

raw_back_x = raw_back_x.';
raw_back_y = raw_back_y.';
raw_back_z = raw_back_z.';

half_kernel = 50;
g=gaussian_filter(half_kernel*2, 10);
g = g(half_kernel -1 ,:);
g = g/sum(g);

half_kernel = half_kernel * 2;
smooth_x = conv(raw_x,g);
smooth_x = smooth_x(1, half_kernel : length(smooth_x) - half_kernel); 

smooth_y = conv(raw_y,g);
smooth_y = smooth_y(1, half_kernel : length(smooth_y) - half_kernel); 

smooth_z = conv(raw_z,g);
smooth_z = smooth_z(1, half_kernel : length(smooth_z) - half_kernel); 


 smooth_back_x = conv(raw_back_x,g);
 smooth_back_x = smooth_back_x(1, half_kernel : length(smooth_back_x) - half_kernel); 

% smooth_y = conv(raw_y,g);
% smooth_y = smooth_y(1, half_kernel : length(smooth_y) - half_kernel); 
% 
% smooth_z = conv(raw_z,g);
% smooth_z = smooth_z(1, half_kernel : length(smooth_z) - half_kernel); 





plot(front_time, raw_back_x);
title('raw X ');
figure;
% plot(front_time, raw_y);
% title('raw_y');
% figure;
% plot(front_time, raw_z);
% title('raw_z');
% figure;
% % 
   plot(1:length(smooth_x), smooth_back_x);
   title('smooth_x');
   figure;
%  plot(1:length(smooth_y), smooth_y);
%  title('smooth_y');
%  figure;
%  plot(1:length(smooth_z), smooth_z);
%  title('smooth_z');
%  figure;

%  wave = smooth_x(565:865);%3rd_test er front sensor staable
% wave = raw_back_x;
wave = smooth_back_x;
y  = bpfilt(wave,0.05,10,true);
y = y';

% wave = fff;
nfft = length(wave);
nfft2 = 2^nextpow2(nfft); % length of signal in power of 2
ff = fft(y,nfft2);

% ff = fft(raw_x,nfft2);
% ff = fft(raw_x,nfft2);
fff = ff(1:nfft2/2);
xfft = 58.34306*(0:nfft2/2-1)/nfft2;
plot(xfft,abs(fff));
title('after fft to smooth back x');


