function y = lowpass_moving_average(x, window_len)
% lowpass_moving_average
% Simple low-pass filter using moving average

if window_len < 1
    error('window_len must be >= 1');
end

b = (1/window_len) * ones(1, window_len);
a = 1;

y = filter(b, a, x);
end
