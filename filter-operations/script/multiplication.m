F = [zeros(56, 128); ones(16, 128); zeros(56, 128)];
%F = phone;
G = F';
%G = vad;
Fhat = fft2(F);
Ghat = fft2(G);
sz = size(F, 1);

% plot
figure(1)
subplot(2,2,1)
showgrey(F);
title('F');
subplot(2,2,2)
showgrey(G);
title('G');
subplot(2,2,3)
showgrey(F .* G);
title('F.*G');
subplot(2,2,4)
showfs(fft2(F .* G));
title('fft2(F .* G)');

figure(2)
subplot(1, 3, 1)
showfs(Fhat);
title('Fhat');
subplot(1, 3, 2)
showfs(Ghat);
title('Ghat');
subplot(1, 3, 3)
con_FG = conv2(fftshift(Fhat), fftshift(Ghat), 'same') / (sz^2);
con_FG = fftshift(con_FG);
showfs(con_FG);
title('conv2(Fhat, Ghat)');
