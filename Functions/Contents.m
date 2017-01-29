% Image processing library 2D1420 Computer Vision
%
% Image transformations
%
%   cartcutout           -- cut out subwindow of an image
%   compose              -- transform grey-level values using index vector
%   cutout               -- cut out subwindow of an image 
%   rot                  -- rotate an image in the spatial domain
%
% Digital geometry   
%
%   locmax4              -- detect local maxima based on 4-connectivity
%   locmax8              -- detect local maxima based on 8-connectivity
%
% Filtering 
%
%   binsepsmooth         -- convolve image with separable binomial filter
%   binsepsmoothiter     -- iterative separable binomial filtering
%   binsmooth            -- convolve with non-separable binomial filter
%   binsmoothiter        -- iterative non-separable binomial filtering
%   bworth               -- filter an image with Butterworth filter
%   discgaussfft         -- filter with discrete Gaussian kernel
%   discgausswinvfft     -- inverse discrete Gaussian filtering
%   ideal                -- perform ideal low pass filtering
%   medfilt              -- perform median filtering
%
% Filter masks
%
%   binsepsmoothfilter   -- returns mask for separable binomial filter
%   binsmoothfilter      -- returns mask for non-separable binomial filter
%   laplacecrossop       -- the Laplacian cross operator
%   laplace5ptop         -- the Laplacian five point operator
%   invdiscgausspsf      -- composed Gaussian and inverse filtering
%
% Subsampling
%
%   binsubsample         -- reduce image size using binomial presmoothing
%   rawsubsample         -- reduce image size by raw subsampling 
%
% Generation of synthetic images
%
%   deltafcn             -- generate discrete delta function
%   gaussnoise           -- add white Gaussian noise to image
%   pow2image            -- transform power spectrum to negative power law
%   sapnoise             -- add salt- and peppar noise to an image
%
% Curve handling
%
%   overlaycurves        -- overlay polygons on image
%   pixelplotcurves      -- creates pixel map from polygons
%   printcurves          -- prints information about polygons
%   signofcurvepointisOK -- sign check in mask image
%   thresholdcurves      -- threshold polygons on magnitude
%   zerocrosscurves      -- detect zero-crossing curves
%
% Display functions
%
%   showfs               -- display Fourier spectrum of an image
%   showgray             -- display grey-level image (American spelling)
%   showgray             -- display grey-level image (English spelling)
%
% Three-dimensional projections
%
%   Pmatrix              -- projection matrix in hom coord
%   depthmatrix          -- depth translation matrix in hom coord
%   normhomcoord         -- normalize homogeneous coordinates
%   swapYZcoord          -- interchange coordinate systems
%   Zrotatematrix        -- matrix for rotation around Z axis
%   pointplot            -- plot a set of points
%
% Synthetic three-dimensional wireframe models
%
%   cube
%   house
%   halfhouse
%
% Visualization of three-dimensional wireframe models
%
%   projobj              -- compute 2-D projection of 3-D wire frame
%   gaussnoiseobj        -- add noise to projecte wire frame model
%   pointplotobject      -- interactive visualization as points
%   lineplotobject       -- interactive visualization as wireframes
%
% Interactive geometric tools
%
%   clickpointcorr       -- mark point correspondences in stereo pair
%
% Spurious help functions
%
%   cartindexpic9         -- test image illustrating coordinate conventions
%   indexpic9             -- test image illustrating coordinate conventions
%   picmean               -- compute mean of (non-negative) filter
%   variance           -- compute variance of (non-negative) filter
%   solvehom              -- solve homogenouse system of equations

% Old functions, not used nor supported in the current version of the course
%
%   bad                    -- Apply biased non-linear diffusion
%   filop
%   ind2int
%   invfunc
%   nophaseimage
%   pad
%   pow2imagesame
%   randphaseimage
%   showglim