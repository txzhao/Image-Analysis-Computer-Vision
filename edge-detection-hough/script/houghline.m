function [linepar, acc] = houghline(curves, magnitude, ...
    nrho, ntheta, threshold, nlines, verbose)

% Check if input appear to be valid
if nrho < 1
    error('nrho must exceed zero');
end

if ntheta < 1
    error('ntheta must exceed zero');
end

if nlines < 1
    error('nlines must exceed zero');
end

% Allocate accumulator space
acc = zeros(nrho, ntheta);

% Define a coordinate system in the accumulator space
theta_x = linspace(-pi/2, pi/2, ntheta);
D = sqrt(size(magnitude, 1)^2 + size(magnitude, 2)^2);
rho_y = linspace(-D, D, nrho);

% Loop over all the input curves (cf. pixelplotcurves)
insize = size(curves, 2);
trypointer = 1;
numcurves = 0;

% For each point on each curve
while trypointer <= insize
    polylength = curves(2, trypointer);
    numcurves = numcurves + 1;
    trypointer = trypointer + 1;
        
    for polyidx = 1 : polylength
        x = curves(2, trypointer);
        y = curves(1, trypointer);
        trypointer = trypointer + 1;
            
        % Check if valid point with respect to threshold
        mag = magnitude(round(x), round(y));
        if mag < threshold
            continue;
        end
        
        % Optionally, keep value from magnitude image
        delta_S = 1;
%         delta_S = mag^2;
%         delta_S = log(mag);

        % Loop over a set of theta values
        for theta_index = 1 : ntheta
            % Compute rho for each theta value
            theta = theta_x(theta_index);
            rho = x * cos(theta) + y * sin(theta);
                
            % Compute index values in the accumulator space
%             delta = 2 * D / (nrho - 1);
%             rho_index = round((rho + 2 * D) / delta + 1);
            rho_index = find(rho_y < rho, 1, 'last');
                
            % Update the accumulator
            acc(rho_index, theta_index) = acc(rho_index, theta_index) + delta_S;
         end
    end
end
 
% smoothen the histogram
acc = binsepsmoothiter(acc,0,10);

% Extract local maxima from the accumulator
[pos, value] = locmax8(acc);
[~, indexvector] = sort(value);
nmaxima = size(value, 1);

% Compute a line for each one of the strongest responses in the accumulator
linepar = zeros(2, nlines);
for  idx = 1 : nlines
    rhoidxacc = pos(indexvector(nmaxima - idx + 1), 1);
    thetaidxacc = pos(indexvector(nmaxima - idx + 1), 2);
    rho = rho_y(rhoidxacc);
    theta = theta_x(thetaidxacc);
    linepar(:, idx) = [rho; theta];
end

end


