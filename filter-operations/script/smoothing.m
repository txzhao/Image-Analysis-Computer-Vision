office = office256;
add = gaussnoise(office, 16);
sap = sapnoise(office, 0.1, 255);

% gaussian vs. gaussian
figure(1)
subplot(1,3,1)
showgrey(gaussfft(add,0.1));
subplot(1,3,2)
showgrey(gaussfft(add,1));
subplot(1,3,3)
showgrey(gaussfft(add,10));

% lowpass vs. gaussian
figure(3)
subplot(1,3,1)
showgrey(ideal(add,0.01));
subplot(1,3,2)
showgrey(ideal(add,0.2));
subplot(1,3,3)
showgrey(ideal(add,0.5));

% medfilt vs. gaussian
figure(2)
subplot(1,3,1)
showgrey(medfilt(add,4));
subplot(1,3,2)
showgrey(medfilt(add,8));
subplot(1,3,3)
showgrey(medfilt(add,10));

% gaussian vs. sasp
figure(4)
subplot(1,3,1)
showgrey(gaussfft(sap,0.1));
subplot(1,3,2)
showgrey(gaussfft(sap,1));
subplot(1,3,3)
showgrey(gaussfft(sap,10));


% medfilt vs. sap
figure(5)
subplot(1,3,1)
showgrey(medfilt(sap,4));
subplot(1,3,2)
showgrey(medfilt(sap,8));
subplot(1,3,3)
showgrey(medfilt(sap,10));

% lowpass vs. sap
figure(6)
subplot(1,3,1)
showgrey(ideal(sap,0.01));
subplot(1,3,2)
showgrey(ideal(sap,0.2));
subplot(1,3,3)
showgrey(ideal(sap,0.5));

