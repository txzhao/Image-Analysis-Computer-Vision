house = godthem256;
tools = few256;
scale = [0.0001 1 4 16 64];

figure('name', 'zero crossings')
for n = 1 : 5
    subplot(2,3,n)
    contour(Lvvtilde(discgaussfft(tools, scale(n)), 'same'), [0 0]);
    axis('image')
    axis('ij')
    if n == 1
        title(sprintf('scale = %.4f', scale(1)));
    else
        title(sprintf('scale = %.1f', scale(n)));
    end        
end

figure('name', 'sign variations')
for n = 1 : 5
    subplot(2,3,n)
    showgrey(Lvvvtilde(discgaussfft(house, scale(n)), 'same') < 0);
    axis('image')
    axis('ij')
    if n == 1
        title(sprintf('scale = %.4f', scale(1)));
    else
        title(sprintf('scale = %.1f', scale(n)));
    end        
end

figure('name', 'lvv + lvvv for tools')
for n = 1 : 5
    subplot(2,3,n)
    lvv = Lvvtilde(discgaussfft(tools, scale(n)), 'same');
    lvvv = Lvvvtilde(discgaussfft(tools, scale(n)), 'same');
    m = lvv;
%     m = lvv.*real(log(1+lvv));
    m(lvvv>0) = NaN;
%     for i = 1 : size(lvv, 1)
%         for j = 1 : size(lvv, 2)
%             if lvvv(i,j) >= 0
%                 lvv(i,j) = 1000000;
%             end
%         end
%     end           
    contour(m, [0 0]);
    axis('image')
    axis('ij')
    if n == 1
        title(sprintf('scale = %.4f', scale(1)));
    else
        title(sprintf('scale = %.1f', scale(n)));
    end
end

figure('name', 'lvv + lvvv for house')
for n = 1 : 5
    subplot(2,3,n)
    lvv = Lvvtilde(discgaussfft(house, scale(n)), 'same');
    lvvv = Lvvvtilde(discgaussfft(house, scale(n)), 'same');
    m = lvv.*real(log(1+lvv));
    m(lvvv>0) = NaN;
%     for i = 1 : size(lvv, 1)
%         for j = 1 : size(lvv, 2)
%             if (lvv(i,j)*lvv(i-1,j)<=0)&&(lvvv(i,j)<0)&&(lvvv(i-1,j)<0)
%                 lvv(i,j) = 100000;
%             end
%         end
%     end   
%     m = improve(lvv,lvvv);
    contour(m, [0 0]);
    axis('image')
    axis('ij')
    if n == 1
        title(sprintf('scale = %.4f', scale(1)));
    else
        title(sprintf('scale = %.1f', scale(n)));
    end
end

% figure
lvv = Lvvtilde(discgaussfft(house, 4), 'same');
lvvv = Lvvvtilde(discgaussfft(house, 4), 'same');
subplot(2,3,1)
contour(Lvvtilde(discgaussfft(house, 4), 'same'), [0 0]);
title(sprintf('zero crossing, scale = %.1f', 4));
axis('image')
axis('ij')
subplot(2,3,2)
showgrey(Lvvvtilde(discgaussfft(house, 4), 'same') < 0);
title(sprintf('sign variation, scale = %.1f', 4));
axis('image')
axis('ij')
subplot(2,3,3)
m = lvv;
m(lvvv>0) = NaN;          
contour(m, [0 0]);
title(sprintf('lvv = 0 & lvvv < 0, scale = %.1f', 4));
axis('image')
axis('ij')
subplot(2,3,4)
contour(Lvvtilde(discgaussfft(house, 16), 'same'), [0 0]);
title(sprintf('zero crossing, scale = %.1f', 16));
axis('image')
axis('ij')
subplot(2,3,5)
showgrey(Lvvvtilde(discgaussfft(house, 16), 'same') < 0);
title(sprintf('sign variation, scale = %.1f', 16));
axis('image')
axis('ij')
subplot(2,3,6)
lvv = Lvvtilde(discgaussfft(house, 16), 'same');
lvvv = Lvvvtilde(discgaussfft(house, 16), 'same');
m = lvv;
m(lvvv>0) = NaN;
contour(m, [0 0]);
title(sprintf('lvv = 0 & lvvv < 0, scale = %.1f', 16));
axis('image')
axis('ij')  
