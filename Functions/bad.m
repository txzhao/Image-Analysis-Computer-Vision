function Est = bad( Orig, scale, thresh, limit, period, Init, mode, relax)
%
%	EST = BAD( ORIG, SCALE, THRESH, LIMIT, PERIOD, INIT, MODE, RELAX)
%	processes the original image ORIG with biased anisotropic diffusion.
%	SCALE is the diffusion scale parameter.
%	It must be in ] 0, inf[.
%	THRESH is the edge enhancement threshold.
%	It must be in ] 0, inf[.
%	LIMIT is the total number of iterations or the number of iterations
%	between prompting the user if the function is run "interactively".
%	It must be in ] 0, inf[.
%	PERIOS is the number of iterations between screen displays.
%	It must be in ] 0, inf].
%	INIT is the initial image from which the DIFFUSION commences.
%	MODE is either 'interact', in which case the user gets a prompt 
%	every LIMIT iterations, or 'noninter', in which case the algorithm
%	runs LIMIT iterations and then terminates.
%	RELAX is the over relaxation index.
%	EST is the diffused image result.
%	It must be in ] 0, 2[.
%	If RELAX is omitted, it is set to 1.
%	If MODE is also omitted, it is set to 'interact'.
%	If INIT is also omitted, it is set to ORIG.
%	If PERIOD is also omitted, it is set to CEIL( LIMIT / 2).
%	If LIMIT is also omitted, it is set to 100.

if nargin < 1
  error( 'Missing argument: arg #1 (Orig) required.')
elseif size( Orig) <= 1	% trivial matrix
  error( 'Bad argument: arg #1 (Orig) must be larger than scalar.')
elseif ~finite( Orig)
  error( 'Bad data: arg #1 (Orig) must be finite.')
end

if nargin < 2
  error( 'Missing argument: arg #2 (scale) required.')
elseif any( size( scale) ~= 1)	% nonscalar
  error( 'Bad argument: arg #2 (scale) must be scalar.')
elseif scale <= 0 | scale == inf
  error( 'Bad data: arg #2 (scale) must be in ] 0, inf[.')
end

if nargin < 3
  error( 'Missing argument: arg #3 (thresh) required.')
elseif any( size( thresh) ~= 1)	% nonscalar
  error( 'Bad argument: arg #3 (thresh) must be scalar.')
elseif thresh <= 0 | thresh == inf
  error( 'Bad data: arg #3 (thresh) must be in ] 0, inf[.')
end

if nargin < 4
  limit = 100;
elseif any( size( limit) ~= 1)	% nonscalar
  error( 'Bad argument: arg #4 (limit) must be scalar.')
elseif limit <= 0 | limit == inf
  error( 'Bad data: arg #4 (limit) must be in ] 0, inf[.')
else
  limit = ceil( limit);
end

if nargin < 5
  period = ceil( limit / 2);
elseif any( size( period) ~= 1)	% nonscalar
  error( 'Bad argument: arg #5 (period) must be scalar.')
elseif period <= 0
  error( 'Bad data: arg #5 (period) must be > 0.')
else
  period = ceil( period);
end

if nargin < 6
  Init = Orig;
elseif size( Init) == 1	& finite( Init)	% finite scalar
  Init = Init * ones( size( Orig));
elseif any( size( Init) ~= size( Orig))	% inconsistent size
  error( 'Bad argument: arg #6 (Init) must have same size as arg #1 (Orig).')
elseif ~finite( Init)
  error( 'Bad data: arg #6 (Init) must be finite.')
end

if nargin < 7
  mode = 'i';
elseif ~isstr( mode) | isempty( mode)	% not string
  error( 'Bad argument: arg #7 (mode) must be a nonempty string.')
end

if nargin < 8
  relax = 1;
elseif any( size( relax) ~= 1)	% nonscalar
  error( 'Bad argument: arg #8 (relax) must be scalar.')
elseif relax <= 0 | relax >= 2
  error( 'Bad data: arg #8 (relax) must be in ] 0, 2[.')
end

zmax = max( max( [ Orig Init]));
zmin = min( min( [ Orig Init]));

if mode( 1) ~= 'n'
  ofig = figure;
  showglim( Orig, 64, zmax, zmin)
  title( sprintf( 'Original image'))
  efig = figure;
  showglim( Init, 64, zmax, zmin)
  title( sprintf( 'Initial image'))
  figure( efig)
end

sz1 = size( Orig, 1);
sz2 = size( Orig, 2);
Est = Init;
mu = scale ^ 2;
dt = relax / ( 1 + 4 * mu);
t82 = ( 8 * thresh) ^ 2;
lambda64 = mu * t82;
itno = 0;

while 1

  De = conv2( Est( [ 1 1: sz1 sz1], [ 1 1: sz2 sz2]), ...
	[	 0  0  0
		 1 -1  0
		 0  0  0	], 'valid');

  Dn = conv2( Est( [ 1 1: sz1 sz1], [ 1 1: sz2 sz2]), ...
	[	 0  0  0
		 0 -1  0
		 0  1  0	], 'valid');

  Dw = conv2( Est( [ 1 1: sz1 sz1], [ 1 1: sz2 sz2]), ...
	[	 0  0  0
		 0 -1  1
		 0  0  0	], 'valid');

  Ds = conv2( Est( [ 1 1: sz1 sz1], [ 1 1: sz2 sz2]), ...
	[	 0  1  0
		 0 -1  0
		 0  0  0	], 'valid');

  D1 = conv2( Est( [ 1 1 1: sz1 sz1 sz1], [ 1 1 1: sz2 sz2 sz2]), ...
	[	 1  2  1
		 0  0  0
		-1 -2 -1	], 'valid');

  D2 = conv2( Est( [ 1 1 1: sz1 sz1 sz1], [ 1 1 1: sz2 sz2 sz2]), ...
	[	 1  0 -1
		 2  0 -2
		 1  0 -1	], 'valid');

  D1e = conv2( D1, [	 0  0  0
			 1  1  0
			 0  0  0	], 'valid');

  D2e = conv2( D2, [	 0  0  0
			 1  1  0
			 0  0  0	], 'valid');

  D1n = conv2( D1, [	 0  0  0
			 0  1  0
			 0  1  0	], 'valid');

  D2n = conv2( D2, [	 0  0  0
			 0  1  0
			 0  1  0	], 'valid');

  D1w = conv2( D1, [	 0  0  0
			 0  1  1
			 0  0  0	], 'valid');

  D2w = conv2( D2, [	 0  0  0
			 0  1  1
			 0  0  0	], 'valid');

  D1s = conv2( D1, [	 0  1  0
			 0  1  0
			 0  0  0	], 'valid');

  D2s = conv2( D2, [	 0  1  0
			 0  1  0
			 0  0  0	], 'valid');

  Est = Est + dt * ...
	( ...
	Orig - Est + lambda64 * ...
		( ...
		De ./ ( t82 + D1e .^ 2 + D2e .^ 2) ...
		+ ...
		Dn ./ ( t82 + D1n .^ 2 + D2n .^ 2) ...
		+ ...
		Dw ./ ( t82 + D1w .^ 2 + D2w .^ 2) ...
		+ ...
		Ds ./ ( t82 + D1s .^ 2 + D2s .^ 2) ...
		) ...
	);

  itno = itno + 1;

  if mode( 1) == 'n'

    if ~rem( itno, limit)
      return
    end

  else
    fprintf( 2, ' %d', itno)

    if ~rem( itno, limit)
      showglim( Est, 64, zmax, zmin)
      title( sprintf( 'Estimated image after %d iterations', itno))
      figure( efig)
      is = input( 'Continue [c]? Break (b)? or Keyboard (k)? ', 's');

      if isempty( is)
      elseif is( 1) == 'b'
        is = input( 'Close figures y/[n]? ', 's');

        if isempty( is)
        elseif is( 1) == 'y'
	  close( ofig)
	  close( efig)
        end

        return
      elseif is( 1) == 'k'
        fprintf( 2, 'Access to variables.  Type "retrurn" to continue.', itno)
        keyboard
      end

    elseif ~rem( itno, period)
      showglim( Est, 64, zmax, zmin)
      title( sprintf( 'Estimated image after %d iterations', itno))
      figure( efig)
    end

  end

end
