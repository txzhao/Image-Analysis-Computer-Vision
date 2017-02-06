function houghedgeline(pic, scale, gradmagnthreshold, ...
    nrho, ntheta, nlines, verbose)

curves = extractedge(pic, scale, gradmagnthreshold, 'same');
magnitude = Lv(pic, true, scale, 'same');

if verbose == 1
    figure('name', 'overlaycurves: image + edge segments')
    overlaycurves(pic, curves);

    figure('name', 'gradient magnitude')
    showgrey(magnitude);
end

[linepar, acc] = houghline(curves, magnitude, nrho, ntheta,...
    gradmagnthreshold, nlines, verbose);
visual_output(pic, linepar);

if verbose == 2
    figure('name', 'parameter space')
    showgrey(acc);
    figure('name', 'parameter space with smoothing')
    showgrey(binsepsmoothiter(acc, 0.5, 1));
%     figure('name', 'overlaycurves: magnitude + edge lines')
%     visual_output(magnitude, linepar);

end