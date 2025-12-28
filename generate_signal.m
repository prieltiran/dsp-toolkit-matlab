function [t, x_clean, x_noisy] = generate_signal(fs, duration, f0)
% generate_signal
% Creates a clean sine signal and a noisy version

N = round(fs * duration);
t = (0:N-1) / fs;

x_clean = sin(2*pi*f0*t);

noise_amp = 0.4;
x_noisy = x_clean + noise_amp * randn(size(t));
end
