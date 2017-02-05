img = phonecalc256;
gauss_smooth = img;
lowpass_smooth = img;
N = 5;

% relation between smoothing and subsample
for i = 1 : N
    if i > 1 
        gauss_smooth = gaussfft(img, 0.5); 
        lowpass_smooth = ideal(img, 0.35);
        img = rawsubsample(img);
        gauss_smooth = rawsubsample(gauss_smooth);
        lowpass_smooth = rawsubsample(lowpass_smooth);
        
    end
    subplot(3, N, i)
    showgrey(img);
    subplot(3, N, i+N)
    showgrey(gauss_smooth);
    subplot(3, N, i+2*N)
    showgrey(lowpass_smooth);
end