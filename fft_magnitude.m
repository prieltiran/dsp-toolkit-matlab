function [f, Xmag] = fft_magnitude(x, fs)
% fft_magnitude
% Returns single-sided FFT magnitude

N = length(x);
X = fft(x);

Xmag = abs(X / N);
Xmag = Xmag(1:floor(N/2)+1);
Xmag(2:end-1) = 2*Xmag(2:end-1);

f = fs * (0:floor(N/2)) / N;
end
