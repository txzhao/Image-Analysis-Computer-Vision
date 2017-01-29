function out = cube(depth, angle)

if (nargin < 1)
  depth = 40;
end
if (nargin < 2)
  angle = 45*pi/180;
end

% Container for points
object.point = zeros(4, 8);

% The points on the bottom surface
object.point(:,1) = [-2,  2, -2, 1]';
object.point(:,2) = [ 2,  2, -2, 1]';
object.point(:,3) = [-2, -2, -2, 1]';
object.point(:,4) = [ 2, -2, -2, 1]';

% The points on the top surface
object.point(:,5) = [-2,  2,  2, 1]';
object.point(:,6) = [ 2,  2,  2, 1]';
object.point(:,7) = [-2, -2,  2, 1]';
object.point(:,8) = [ 2, -2,  2, 1]';

% Container for lines
object.line = zeros(2, 12);

% The lines on the bottom surface
object.line(:, 1) = [1, 2]';
object.line(:, 2) = [2, 4]';
object.line(:, 3) = [4, 3]';
object.line(:, 4) = [3, 1]';

% The lines connecting the top and bottom surfaces
object.line(:, 5) = [1, 5]';
object.line(:, 6) = [2, 6]';
object.line(:, 7) = [3, 7]';
object.line(:, 8) = [4, 8]';

% The lines on the top surface
object.line(:, 9) = [5, 6]';
object.line(:,10) = [6, 8]';
object.line(:,11) = [8, 7]';
object.line(:,12) = [7, 5]';

if (depth <= 0.0)
  out.point = object.point;
else
  % Now, swap the Y- and Z-axes and put the object at a given depth
  out.point = depthmatrix(depth) * swapYZmatrix * Zrotatematrix(angle) ...
      * object.point;
end
out.line = object.line;
