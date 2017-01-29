function [xL, xR] = clickpointcorr(imgL, imgR, xleft, xright, marklabels)

% [xleft, xright] = clickpointcorr(imgL, imgR) 
% 
%   Interactive routine for generating point correspondences 
%   from two images 'imgL' and 'imgR' in a stereopair.
%
%   The output is a pair of matrices, containing homogeneous
%   image coordinates from the first and second image according to
%
%          (x1 x2 x3 ... xn)         (x1' x2' x3' ... xn')
%     xL = (y1 y2 y3 ... yn)    xR = (y1' y2' y3' ... yn')
%          ( 1  1  1 ...  1)         ( 1   1   1  ...   1) 
%
%   If the optional parameters xleft and xright are specified, then
%   these correspondences are displayed and any the new point 
%   correspondences are appended to these.
%
%   With these parameters specified, this function can also serve
%   as a convenient display function. If the argument "marklabels"
%   is given a positive value, then the indeces of the points will
%   be marked in the image.
%
%   Backup: If you by accident forget to save the result of your session
%   in the output variables xL and xR, you can retrieve these data by
%   the matlab command "load clickpointcorr-bkp"

clf

subplot(1,2,1); showgrey(imgL); hold;
subplot(1,2,2); showgrey(imgR); hold;

disp('* To indicate a point correspondence, click with the left button to')
disp('  mark first a point in the left image and then the right image.')
disp('* Exit by clicking on the right button.')

if (nargin < 5)
  marklabels = 0;
end


if (nargin < 3)
  % No previous correspondences specified
  maxnum = 1;
  left = zeros(3, maxnum);
  right = zeros(3, maxnum);
  num = 0;
else
  % Use given point  correspondences and display these  
  left =  xleft;
  right = xright;
  maxnum = size(left, 2);
  num = maxnum;

  subplot(1, 2, 1);
  for k = 1:maxnum
    if (marklabels > 0)
      string = sprintf('%d', k);
      text(left(1,k), left(2,k), string);
    else
      plot(left(1,k), left(2,k), 'ro');
    end
  end
  
  subplot(1, 2, 2);
  for k = 1:maxnum
   if (marklabels > 0)
      string = sprintf('%d', k);
      text(right(1,k), right(2,k), string);
    else
      plot(right(1,k), right(2,k), 'ro');
    end
  end
end

do_continue = 1;

while (do_continue > 0)
  num = num + 1;
  
  if (num > maxnum)
    newmaxnum = 2*maxnum;
    newleft = zeros(3, newmaxnum);
    newleft(:, 1:maxnum) = left(:, 1:maxnum);
    left = newleft;
    newright = zeros(3, newmaxnum);
    newright(:, 1:maxnum) = right(:, 1:maxnum);
    right = newright;
    maxnum = newmaxnum;
  end


  subplot(1, 2, 1);
  [xl, yl, button] = ginput(1);
  
  if (button == 3)
    do_continue = 0;
  end
  
  if (do_continue > 0)
    plot(xl, yl, 'ro');
    left(:, num)=[xl yl 1]';
  
    subplot(1, 2, 2);
    [xr, yr, button] = ginput(1);

    if (button == 3)
      do_continue = 0;
    end

    if  (do_continue > 0)
      plot(xr, yr, 'go');
      right(:, num) = [xr yr 1]';
    end
    
    s = sprintf('Pair %3d: L = (%5.2f, %5.2f)^T R = (%5.2f, %5.2f)^T', ...
		num, xl, yl, xr, yr);
    disp(s)
   
  end
end

num = num - 1;

disp(sprintf('Totally %d point correspondences registered', num))

xL(:, 1:num) = left(:, 1:num)
xR(:, 1:num) = right(:, 1:num)

save clickpointcorr-bkp xL xR
disp(sprintf('Backup saved to file clickpointcorr-bkp.mat'))

subplot(1,2,1);
hold off;
subplot(1,2,2);
hold off;
