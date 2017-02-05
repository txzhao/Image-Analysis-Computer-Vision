F1 = [zeros(60, 128); ones(8, 128); zeros(60, 128)];
F2 = [zeros(128, 48) ones(128, 32) zeros(128, 48)];
F = F1.*F2;
F_p = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = F_p';
% figure(1)
% subplot(1,3,1)
% showgrey(F1);
% subplot(1,3,2)
% showgrey(F2);
% subplot(1,3,3)
% showgrey(F);
% figure(2)
% showfs(fft2(F));
subplot(2,2,1)
showgrey(F_p.*G);
title('Previous F');
subplot(2,2,2)
showgrey(F);
title('F');
subplot(2,2,3)
showfs(fft2(F_p.*G));
title('Fourier transform of previous F');
subplot(2,2,4)
showfs(fft2(F));
title('Fourier transform of F');