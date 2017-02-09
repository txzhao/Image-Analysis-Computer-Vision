function [ segmentation, centers ] = kmeans_segm_mix(image, K, L, seed)

  % The height and width of the image
  height = size(image, 1);
  width = size(image, 2);

  % Initialize random centers

  %centers = [255 255 255; 248 136 2];
  centers = [];

  rng(seed);
  rand_colours = rand(K, 3);

  centers = [centers; rand_colours];

  K = size(centers, 1);


  % This maps every pixel to the kernel closest to it
  segmentation = zeros(height * width, 1);

  % A pixels x centers matrix.
  pixel_to_kernel_distance = zeros(height * width, K);

  for l = 1:L

    % --------------------------------------------------------------------------
    % Assign each pixel to the cluster center for which the distance is minimum
    pixel_to_kernel_distance  = pdist2(image, centers, 'euclidean');

    [min_distance segmentation] = min(pixel_to_kernel_distance, [], 2);

    % --------------------------------------------------------------------------
    % Recompute each cluster center by taking the
    % mean of all pixels assigned to it
    for kernel = 1:K

      pixels = 0;

      means = zeros(1,3);
      means = double(means);

      for pixel = 1:height
        if segmentation(pixel) == kernel

          pixels = pixels + 1;

          means(1) = ((pixels - 1) * means(1) + image(pixel, 1)) / pixels;
          means(2) = ((pixels - 1) * means(2) + image(pixel, 2)) / pixels;
          means(3) = ((pixels - 1) * means(3) + image(pixel, 3)) / pixels;
        end
      end

      centers(kernel, :) = means;

    end % End kernel loop

  end % End l loop

end % End function