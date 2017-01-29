function im = ppmread(filename)
%PPMREAD - Read PPM image file
%    IM = PPMREAD(FILENAME)
%     
%    Author: Peter Nillius <nillius@nada.kth.se>
%            
%    Freeware 1999
%

fid = fopen(filename);

% Read header
head = fgetl(fid);
if ~(head == 'P6')
  error('Error: not an PPM image file.');
end

% Read first line
line = fgetl(fid);

% Skip comments
while line(1) == '#'
  line = fgetl(fid);
end

% Parse image size
siz = sscanf(line, '%i %i');

% Read next line
line = fgetl(fid);

maxval = sscanf(line, '%i');
%maxval = maxvals(1);

% How many bytes/pixel?
if maxval == 65535
  tmp = fread(fid, [siz(1)*3, siz(2)], 'uint16');
  % Fix big/little endian
  tmp = floor(tmp/256)+rem(tmp, 256)*256;
elseif maxval == 255
  tmp = fread(fid, [siz(1)*3, siz(2)], 'uint8');
else
  error(['Error: cannot handle max pixel value: ' num2str(maxval)]);
end

% Move the colors to where matlab wants them and scale to [0,1]
im = zeros(siz(2), siz(1), 3);
n = siz(1)*siz(2)*3;
im(:,:,1) = reshape(tmp(1:3:n), siz(1), siz(2))'/maxval;
im(:,:,2) = reshape(tmp(2:3:n), siz(1), siz(2))'/maxval;
im(:,:,3) = reshape(tmp(3:3:n), siz(1), siz(2))'/maxval;

fclose(fid);
