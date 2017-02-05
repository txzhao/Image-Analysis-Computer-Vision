pic1 = phonecalc128;
pic2 = few128;
pic3 = nallo128;

figure(1)
subplot(1,3,1)
%pixels1 = gaussfft(pic1, 1);
showgrey(pic1);
subplot(1,3,2)
%pixels2 = gaussfft(pic1, 1);
showgrey(pic2);
subplot(1,3,3)
%pixels3 = gaussfft(pic1, 1);
showgrey(pic3);

figure(2)
subplot(1,3,1)
pixels1 = gaussfft(pic1, 1);
showgrey(pixels1);
subplot(1,3,2)
pixels2 = gaussfft(pic2, 1);
showgrey(pixels2);
subplot(1,3,3)
pixels3 = gaussfft(pic3, 1);
showgrey(pixels3);

figure(3)
subplot(1,3,1)
pixels1 = gaussfft(pic1, 4);
showgrey(pixels1);
subplot(1,3,2)
pixels2 = gaussfft(pic2, 4);
showgrey(pixels2);
subplot(1,3,3)
pixels3 = gaussfft(pic3, 4);
showgrey(pixels3);

figure(4)
subplot(1,3,1)
pixels1 = gaussfft(pic1, 16);
showgrey(pixels1);
subplot(1,3,2)
pixels2 = gaussfft(pic2, 16);
showgrey(pixels2);
subplot(1,3,3)
pixels3 = gaussfft(pic3, 16);
showgrey(pixels3);

figure(5)
subplot(1,3,1)
pixels1 = gaussfft(pic1, 64);
showgrey(pixels1);
subplot(1,3,2)
pixels2 = gaussfft(pic2, 64);
showgrey(pixels2);
subplot(1,3,3)
pixels3 = gaussfft(pic3, 64);
showgrey(pixels3);

figure(6)
subplot(1,3,1)
pixels1 = gaussfft(pic1, 256);
showgrey(pixels1);
subplot(1,3,2)
pixels2 = gaussfft(pic2, 256);
showgrey(pixels2);
subplot(1,3,3)
pixels3 = gaussfft(pic3, 256);
showgrey(pixels3);