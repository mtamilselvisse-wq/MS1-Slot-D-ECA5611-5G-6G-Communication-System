clear;
close all;
clc;

%% Parameters
Fs = 600e3;          % Sampling frequency
t = 0:1/Fs:5e-3;     % 5 ms duration
fm = 5e3;            % Message frequency (5 kHz)
fc = 20e3;           % Carrier frequency (20 kHz)

%% Message Signal
m = sin(2*pi*fm*t);

%% Carrier Signal
c = cos(2*pi*fc*t);

%% DSB-SC Modulated Signal
s = m .* c;

%% Plotting

figure;

subplot(4,1,1);
plot(t(1:1000), m(1:1000), 'LineWidth', 1.3);
title('Message Signal (5 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,2);
plot(t(1:1000), c(1:1000), 'LineWidth', 1.3);
title('Carrier Signal (20 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(t(1:1000), s(1:1000), 'LineWidth', 1.3);
title('DSB-SC Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Spectrum Analysis

N = length(s);
S = abs(fft(s))/N;
f = (-N/2:N/2-1)*(Fs/N);

subplot(4,1,4);
plot(f, fftshift(S), 'LineWidth', 1.3);
title('Spectrum of DSB-SC Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
xlim([0 40e3]);

%% Peak Frequency Calculation (No Command Window Output)

[~, idx] = max(fftshift(S));
peak_freq = f(idx);
