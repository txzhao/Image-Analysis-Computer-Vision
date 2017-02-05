F = [zeros(60, 128); ones(8, 128); zeros(60, 128)] .* ...
[zeros(128, 48) ones(128, 32) zeros(128, 48)];
alpha = 40;
G = rot(F, alpha);
Ghat = fft2(G);
Hhat = rot(fftshift(Ghat), -alpha);

% figure(1)
% subplot(1,2,1)
% showgrey(F);
% subplot(1,2,2)
% showgrey(G);
% 
% figure(2)
% subplot(1,3,1)
% showfs(fft2(F));
% subplot(1,3,2)
% showfs(Ghat);
% subplot(1,3,3)
% showgrey(log(1 + abs(Hhat)));
A = log(1 + abs(rot(fftshift(fft2(rot(F, 30))), -30)));

subplot(5,3,1)
showgrey(F);
title('0 degree');
subplot(5,3,2)
showfs(fft2(F));
subplot(5,3,4)
showgrey(rot(F, 30));
title('30 degree');
subplot(5,3,5)
showfs(fft2(rot(F, 30)));
subplot(5,3,6)
showgrey(log(1 + abs(rot(fftshift(fft2(rot(F, 30))), -30))));
subplot(5,3,7)
showgrey(rot(F, 45));
title('45 degree');
subplot(5,3,8)
showfs(fft2(rot(F, 45)));
subplot(5,3,9)
showgrey(log(1 + abs(rot(fftshift(fft2(rot(F, 45))), -45))));
subplot(5,3,10)
showgrey(rot(F, 60));
title('60 degree');
subplot(5,3,11)
showfs(fft2(rot(F, 60)));
subplot(5,3,12)
showgrey(log(1 + abs(rot(fftshift(fft2(rot(F, 60))), -60))));
subplot(5,3,13)
showgrey(rot(F, 90));
title('90 degree');
subplot(5,3,14)
showfs(fft2(rot(F, 90)));
subplot(5,3,15)
showgrey(log(1 + abs(rot(fftshift(fft2(rot(F, 90))), -90))));
