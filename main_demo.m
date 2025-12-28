% main_demo.m
% DSP Toolkit demo: signal generation, FFT, and basic low-pass filtering

clear; close all; clc;

fs = 1000;          % sampling frequency [Hz]
duration = 1.0;     % seconds
f0 = 50;            % sine frequency [Hz]

[t, x_clean, x_noisy] = generate_signal(fs, duration, f0);

% Simple low-pass filtering (moving average)
window_len = 15;
x_filt = lowpass_moving_average(x_noisy, window_len);

% FFT magnitude
[f, X_clean] = fft_magnitude(x_clean, fs);
[~, X_noisy] = fft_magnitude(x_noisy, fs);
[~, X_filt]  = fft_magnitude(x_filt, fs);

% ---- Plots ----
figure;
plot(t, x_clean); hold on;
plot(t, x_noisy);
plot(t, x_filt);
grid on;
xlabel('Time [s]');
ylabel('Amplitude');
legend('Clean', 'Noisy', 'Filtered');
title('Time Domain');

figure;
plot(f, X_clean); hold on;
plot(f, X_noisy);
plot(f, X_filt);
grid on;
xlabel('Frequency [Hz]');
ylabel('|X(f)|');
legend('Clean', 'Noisy', 'Filtered');
title('Frequency Domain (FFT Magnitude)');
xlim([0 300]);
