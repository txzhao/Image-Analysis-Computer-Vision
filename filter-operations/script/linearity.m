F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = F';
H = F + 2 * G;
Fhat = fft2(F);
Ghat = fft2(G);
Hhat = fft2(H);

% plot
figure(1)
subplot(1,3,1)
showgrey(F);
title('F');
subplot(1,3,2)
showgrey(G);
title('G = Tran(F)');
subplot(1,3,3)
showgrey(H);
title('H = F + 2G');

figure(2)
subplot(2,2,1)
showgrey(log(1 + abs(Fhat)));
title('log(1 + abs(Fhat))');
subplot(2,2,2)
showgrey(log(1 + abs(Ghat)));
title('log(1 + abs(Ghat))');
subplot(2,2,3)
showgrey(log(1 + abs(Hhat)));
title('log(1 + abs(Hhat))');
subplot(2,2,4)
showgrey(log(1 + abs(fftshift(Hhat))));
%showfs(log(1 + abs(Hhat)));
title('log(1 + abs(fftshift(Hhat)))');

figure(3)
subplot(2,2,1)
showgrey(abs(fftshift(Hhat)));
title('abs(fftshift(Hhat))');
subplot(2,2,2)
showgrey(log(1 + abs(fftshift(Hhat))));
title('log(1 + abs(fftshift(Hhat)))');
subplot(2,2,3)
hist(1 + abs(fftshift(Hhat)),256);
title('histogram before logrithm');
subplot(2,2,4)
hist(log(1 + abs(fftshift(Hhat))),256);
title('histogram after logrithm');
