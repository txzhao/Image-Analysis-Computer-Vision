figure(1)
psf = gaussfft(deltafcn(128, 128), 0.1);
var1 = variance(psf);

subplot(1,2,1)
surf(psf);
subplot(1,2,2)
showfs(fftshift(psf));
% subplot(1,3,3)
% showgrey(ifft(fftshift(psf)));
% psf1 = discgaussfft(deltafcn(128, 128),0.1);

figure(2)
psf = gaussfft(deltafcn(128, 128), 0.3);
var2 = variance(psf);
subplot(1,2,1)
surf(psf);
subplot(1,2,2)
showfs(fftshift(psf));
% subplot(1,3,3)
% showgrey(ifft(fftshift(psf)));

figure(3)
psf = gaussfft(deltafcn(128, 128), 1);
var3 = variance(psf);
subplot(1,2,1)
surf(psf);
subplot(1,2,2)
showfs(fftshift(psf));
% subplot(1,3,3)
% showgrey(ifft(fftshift(psf)));

figure(4)
psf = gaussfft(deltafcn(128, 128), 10);
var4 = variance(psf);
subplot(1,2,1)
surf(psf);
subplot(1,2,2)
showfs(fftshift(psf));

figure(5)
psf = gaussfft(deltafcn(128, 128), 100);
var5 = variance(psf);
subplot(1,2,1)
surf(psf);
subplot(1,2,2)
showfs(fftshift(psf));