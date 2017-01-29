function out = halfhouse(depth, angle)

if (nargin < 1)
  depth = 40;
end
if (nargin < 2)
  angle = 45*pi/180;
end

% Define the object in a centered coordinate system where the
% X- and Y-axes are horisontal, and the Z-axis is vertical.

% Container for points
object.point = zeros(4, 15);

% The points on the bottom surface
object.point(:, 1) = [-5,  3,  0, 1]';
object.point(:, 2) = [-5, -3,  0, 1]';
object.point(:, 3) = [ 5, -3,  0, 1]';

% The points on the top surface
object.point(:, 4) = [-5,  3,  4, 1]';
object.point(:, 5) = [-5, -3,  4, 1]';
object.point(:, 6) = [ 5, -3,  4, 1]';

% Additional points on the top surface
object.point(:, 7) = [-6,  4,  4, 1]';
object.point(:, 8) = [-6, -4,  4, 1]';
object.point(:, 9) = [ 6, -4,  4, 1]';

% The points on the rim
object.point(:,10) = [-6,  0,  6, 1]';
object.point(:,11) = [ 6,  0,  6, 1]';

% A door
object.point(:,12) = [ 1, -3,  0, 1]';
object.point(:,13) = [ 3, -3,  0, 1]';
object.point(:,14) = [ 1, -3,  3, 1]';
object.point(:,15) = [ 3, -3,  3, 1]';


% Container for lines
object.line = zeros(2, 14);

% The lines on the bottom surface
object.line(:, 1) = [1, 2]';
object.line(:, 2) = [2, 3]';

% The lines connecting the top and bottom surfaces
object.line(:, 3) = [1, 4]';
object.line(:, 4) = [2, 5]';
object.line(:, 5) = [3, 6]';

% The horisontal outer boundary part of the roof
object.line(:, 6) = [ 7,  8]';
object.line(:, 7) = [ 8,  9]';

% The sloping boundaries of the roof
object.line(:, 8) = [ 7, 10]';
object.line(:, 9) = [10,  8]';
object.line(:,10) = [11,  9]';

% The rim
object.line(:,11) = [10, 11]';

% The door
object.line(:,13) = [14, 15]';
object.line(:,12) = [12, 14]';
object.line(:,14) = [15, 13]';

% Now, swap the Y- and Z-axes and put the object at a given depth

if (depth <= 0.0)
  out.point = object.point;
else
  % Now, swap the Y- and Z-axes and put the object at a given depth
  out.point = depthmatrix(depth) * swapYZmatrix * Zrotatematrix(angle) ...
      * object.point;
end
out.line = object.line;
