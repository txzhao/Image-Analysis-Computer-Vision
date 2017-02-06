tools = few256;
sdo_x = [-1 0 1];
sdo_y = sdo_x';
cdo_x = [-0.5 0 0.5];
cdo_y = cdo_x';
roberts_pos_dig = [-1 0; 0 1];
roberts_neg_dig = [0 -1; 1 0];
sobel_x = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_y = [-1 0 1; -2 0 2; -1 0 1];
sobel_pos_dig = [0 1 2; -1 0 1; -2 -1 0];
sobel_neg_dig = [-2 -1 0; -1 0 1; 0 1 2];

% sdo
figure('name', 'Simple Difference Operator')
sdxtools = conv2(tools, sdo_x, 'valid');
sdytools = conv2(tools, sdo_y, 'valid');
subplot(1,2,1)
showgrey(sdxtools);
title('x direction');
subplot(1,2,2)
showgrey(sdytools);
title('y direction');

% cdo
figure('name', 'Central Difference Operator')
cdxtools = conv2(tools, cdo_x, 'valid');
cdytools = conv2(tools, cdo_y, 'valid');
% subplot(2,2,1)
% showgrey(sdxtools);
% title('sdo x direction');
% subplot(2,2,2)
% showgrey(sdytools);
% title('sdo y direction');
subplot(1,2,1)
showgrey(cdxtools);
title('cdo x direction');
subplot(1,2,2)
showgrey(cdytools);
title('cdo y direction');

% magnitude
figure('name', 'magnitude')
subplot(1,2,1)
histogram(sdxtools);
title('sdo');
subplot(1,2,2)
histogramfe(cdxtools);
title('cdo');

% roberts
figure('name', 'Roberts Operator')
posdigtools = conv2(tools, roberts_pos_dig, 'valid');
negdigtools = conv2(tools, roberts_neg_dig, 'valid');
subplot(1,2,1)
showgrey(posdigtools);
title('diagonal');
subplot(1,2,2)
showgrey(negdigtools);
title('reverse diagonal');

% sobel
figure('name', 'Sobel Operator')
dxtools = conv2(tools, sobel_x, 'valid');
dytools = conv2(tools, sobel_y, 'valid');
posdigtools = conv2(tools, sobel_pos_dig, 'valid');
negdigtools = conv2(tools, sobel_neg_dig, 'valid');
subplot(2,2,1)
showgrey(dxtools);
title('x direction');
subplot(2,2,2)
showgrey(dytools);
title('y direction');
subplot(2,2,3)
showgrey(posdigtools);
title('diagonal');
subplot(2,2,4)
showgrey(negdigtools);
title('reverse diagonal');
