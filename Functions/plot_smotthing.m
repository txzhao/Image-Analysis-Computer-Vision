% gaussian-guassian
figure(1)
subplot(1,3,1)
showgrey(gaussfft(add, 0.1));
subplot(1,3,2)
showgrey(gaussfft(add, 1));
subplot(1,3,3)
showgrey(gaussfft(add, 10));

% medfilt-guassian
figure(2)
subplot(1,3,1)
showgrey(medfilt(add, 1, 1));
subplot(1,3,2)
showgrey(medfilt(add, 4, 4));
subplot(1,3,3)
showgrey(medfilt(add, 10, 10));

% lowpass-guassian
figure(3)
subplot(1,3,1)
showgrey(ideal(add, 0.01));
subplot(1,3,2)
showgrey(ideal(add, 0.1));
subplot(1,3,3)
showgrey(ideal(add, 0.15));

% gaussian-sap
figure(4)
subplot(1,3,1)
showgrey(gaussfft(sap, 0.1));
subplot(1,3,2)
showgrey(gaussfft(sap, 1));
subplot(1,3,3)
showgrey(gaussfft(sap, 10));

% medfilt-sap
figure(5)
subplot(1,3,1)
showgrey(medfilt(sap, 1, 1));
subplot(1,3,2)
showgrey(medfilt(sap, 4, 4));
subplot(1,3,3)
showgrey(medfilt(sap, 10, 10));

% lowpass-sap
figure(6)
subplot(1,3,1)
showgrey(ideal(sap, 0.01));
subplot(1,3,2)
showgrey(ideal(sap, 0.1));
subplot(1,3,3)
showgrey(ideal(sap, 0.15));
