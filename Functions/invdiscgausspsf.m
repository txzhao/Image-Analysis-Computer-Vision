function pixels = invdiscgausspsf(size, sigma2, gamma, k)

pixels = discgausswinvfft(discgaussfft(deltafcn(size, size), sigma2), sigma2, k);
