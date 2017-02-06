function visual_output(inpic, linepar)

maxrho = sqrt(size(inpic, 1)^2 + size(inpic, 2)^2);
nlines = size(linepar, 2);
outcurves = zeros(2, 4 * nlines);

% extract the lines which had the highest response in the accumulator space
for idx = 1 : nlines
    rho = linepar(1, idx);
    theta = linepar(2, idx);
    if theta == 0
        theta = 1 * 10^(-6);
    end
    
    % Extract three points from each line to create a curve which represents the line
    x0 = 0;
    y0 = (-cos(theta)/sin(theta)) * x0 + (rho/sin(theta));
    dx = maxrho^2;
    dy = (-cos(theta)/sin(theta)) * dx + (rho/sin(theta));
    outcurves(1, 4 * (idx - 1) + 1) = 0;    % level, not significant
    outcurves(2, 4 * (idx - 1) + 1) = 3;    % number of points in the curve
    outcurves(2, 4 * (idx - 1) + 2) = x0 - dx;
    outcurves(1, 4 * (idx - 1) + 2) = y0 - dy;
    outcurves(2, 4 * (idx - 1) + 3) = x0;
    outcurves(1, 4 * (idx - 1) + 3) = y0;
    outcurves(2, 4 * (idx - 1) + 4) = x0 + dx;
    outcurves(1, 4 * (idx - 1) + 4) = y0 + dy;
end

figure('name', 'overlaycurves: image + edge lines')
overlaycurves(inpic, outcurves);
axis([1 size(inpic, 2) 1 size(inpic, 1)]);
end