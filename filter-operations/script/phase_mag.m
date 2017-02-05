img1 = phonecalc128;
img2 = few128;
img3 = nallo128;
a = 10^(-10);
pi_with_pha1 = pow2image(img1, a);
pi_with_mag1 = randphaseimage(img1);
pi_with_pha2 = pow2image(img2, a);
pi_with_mag2 = randphaseimage(img2);
pi_with_pha3 = pow2image(img3, a);
pi_with_mag3 = randphaseimage(img3);

% plot
subplot(3,3,1)
showgrey(img1);
subplot(3,3,2)
showgrey(pi_with_pha1);
subplot(3,3,3)
showgrey(pi_with_mag1);
subplot(3,3,4)
showgrey(img2);
subplot(3,3,5)
showgrey(pi_with_pha2);
subplot(3,3,6)
showgrey(pi_with_mag2);
subplot(3,3,7)
showgrey(img3);
subplot(3,3,8)
showgrey(pi_with_pha3);
subplot(3,3,9)
showgrey(pi_with_mag3);