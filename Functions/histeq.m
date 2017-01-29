function pixels = histeq(image, nacc, verbose)
image_new = change_grey(image, nacc - 1, min(image(:)), max(image(:)));
num = hist(image_new(:), nacc);
T_sum = cumsum(num);    %calculate the cumulative sum for an array
T_sum = T_sum / T_sum(nacc);
for i = 1 : size(image, 1)
    for j = 1 : size(image, 2)
        k = round(image_new(i, j));
        pixels(i, j) = T_sum(k);
    end
end

% plot
if verbose > 0
    figure(1)
    plot(1 : nacc, T_sum);
    title('Transformation Function');
    xlabel('rk');
    ylabel('sk');
    
    figure(2)
    subplot(2, 2, 1);
    hist(image(:), nacc);
    title('Original Histogram');
    subplot(2, 2, 2);
    hist(pixels(:), nacc);
    title('Equalized Histogram');
    subplot(2, 2, 3);
    showgrey(image);
    title('Original Image');
    subplot(2, 2, 4);
    showgrey(pixels);
    title('Processed Image');
end
