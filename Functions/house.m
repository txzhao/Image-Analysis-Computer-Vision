function out = house(depth, angle)

if (nargin < 1)
  depth = 40;
end
if (nargin < 2)
  angle = 45*pi/180;
end

% Define the object in a centered coordinate system where the
% X- and Y-axes are horisontal, and the Z-axis is vertical.

% Container for points
object.point = zeros(4, 22);

% The points on the bottom surface
object.point(:, 1) = [-5,  3,  0, 1]';
object.point(:, 2) = [ 5,  3,  0, 1]';
object.point(:, 3) = [-5, -3,  0, 1]';
object.point(:, 4) = [ 5, -3,  0, 1]';

% The points on the top surface
object.point(:, 5) = [-5,  3,  4, 1]';
object.point(:, 6) = [ 5,  3,  4, 1]';
object.point(:, 7) = [-5, -3,  4, 1]';
object.point(:, 8) = [ 5, -3,  4, 1]';

% Additional points on the top surface
object.point(:, 9) = [-6,  4,  4, 1]';
object.point(:,10) = [ 6,  4,  4, 1]';
object.point(:,11) = [-6, -4,  4, 1]';
object.point(:,12) = [ 6, -4,  4, 1]';

% The points on the rim
object.point(:,13) = [-6,  0,  6, 1]';
object.point(:,14) = [ 6,  0,  6, 1]';

% A door
object.point(:,15) = [ 1, -3,  0, 1]';
object.point(:,16) = [ 3, -3,  0, 1]';
object.point(:,17) = [ 1, -3,  3, 1]';
object.point(:,18) = [ 3, -3,  3, 1]';

% A window
object.point(:,19) = [-3,  3,  2, 1]';
object.point(:,20) = [ 0,  3,  2, 1]';
object.point(:,21) = [-3,  3,  3, 1]';
object.point(:,22) = [ 0,  3,  3, 1]';

% Container for lines
object.line = zeros(2, 28);

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

% Additional lines within the top surface
object.line(:,13) = [ 5,  9]';
object.line(:,14) = [ 6, 10]';
object.line(:,15) = [ 8, 12]';
object.line(:,16) = [ 7, 11]';

% The horisontal outer boundary part of the roof
object.line(:,17) = [ 9, 10]';
object.line(:,18) = [10, 12]';
object.line(:,19) = [12, 11]';
object.line(:,20) = [11, 9]';

% The sloping boundaries of the roof
object.line(:,21) = [ 9, 13]';
object.line(:,22) = [13, 11]';
object.line(:,23) = [10, 14]';
object.line(:,24) = [14, 12]';

% The rim
object.line(:,25) = [13, 14]';

% The door
object.line(:,26) = [15, 17]';
object.line(:,27) = [17, 18]';
object.line(:,28) = [18, 16]';

% The window
object.line(:,29) = [19, 20]';
object.line(:,30) = [19, 21]';
object.line(:,31) = [20, 22]';
object.line(:,32) = [21, 22]';

if (depth <= 0.0)
  out.point = object.point;
else
  % Now, swap the Y- and Z-axes and put the object at a given depth
  out.point = depthmatrix(depth) * swapYZmatrix * Zrotatematrix(angle) ...
      * object.point;
end
out.line = object.line;
