function [ g, ymax, ymin, xres, fpert] = invfunc( f, xmax, xmin, yres, pert)
%	[ G, YMAX, YMIN, XRES, FPERT] = INVFUNC( F, XMAX, XMIN, YRES, PERT)
%	computes the inverse map G of a monotone function F defined on
%	the interval [ XMIN, XMAX].
%	If F is not strictly monotone, it cannot readily be inverted.
%	If it is monotone, but not strictly so, however, and PERT = 'smooth',
%	then an attempt will be made to perturb F into a strictly monotone
%	function FPERT by smoothing.
%	If PERT is omitted it is set to 'none  '.
%	If YRES is omitted it is set to XRES.
%	If XMIN is omitted it is set to zero, unless XMAX is alss omitted,
%	in which case XMIN is set to 1 and XMAX is set to XRES.
%	More precisely, F is represented by a vector [ F( XMIN), ..., F( XMAX)]
%	whose components are uniformly sampled samples of F.
%	Similarly G is represented by a vector [ G( YMIN), ..., G( YMAX)]
%	of uniformly sampled samples of G, where
%	YMIN = min( F( XMIN), F( XMAX)) and YMAX = max( F( XMIN), F( XMAX)).
%	The vaiables XRES and YRES are simply the lengths of these two
%	vectors.
%	However, whereas XRES is an output variable, which depends on F,
%	YRES is an input variable, which determines G.
%	(If XMAX < XMIN, F INVFUNC works as if F were defined on [ XMAX, XMIN].
%	The samples in the vector representing F are then in reversed order,
%	which in particular means that plot( F) will draw a reflected graph.)

if ~nargin
  error( 'Wrong number of input arguments.')
  return
elseif size( f) ~= 1
  error( 'Bad argument: arg #1 (f) must be a vector.')
  return
elseif any( diff( f) < 0) & any( diff( f) > 0)
  error( 'Bad argument: arg #1 (f) must be a monotone function.')
  return
end

xres = length( f);

if nargin == 1
  xmax = xres;
  xmin = 1;
  yres = xres;
  pert = 'none  ';
elseif nargin == 2
  xmin = 0;
  yres = xres;
  pert = 'none  ';
elseif nargin == 3
  yres = xres;
  pert = 'none  ';
elseif nargin == 4
  pert = 'none  ';
end

ymin = f( 1);
ymax = f( xres);
x = linspace( xmin, xmax, xres);
badind1 = [];

if pert == 'smooth'
  df = diff( f);
  ddf = diff( df);
  df( xres - 1) = [];
  badind1 = find( ~ddf & ~df);
  f( badind1 + 1) = [];
  df = diff( f);
  sceps = 2 * eps / min( ~df + abs( df));
  h = [ sceps, 1 - 2 * sceps, sceps];
  xres = xres - length( badind1);
  xres2 = xres + 2;

  while ~all( diff( f))
    fprev = f;
    f = conv( h, f);
    f( [ 1 xres2]) = [];
    f( [ 1 xres]) = [ ymin ymax];

    if ~any( f - fprev)
      error( 'Bad data: arg #1 (f) cannot be perturbed successfully.')
      return
    end

  end

elseif ~all( diff( f))
  error( 'Bad data: arg #1 (f) must be a strictly monotone function.')
  return
end

x( badind1 + 1) = [];

if ymax < ymin
  ym = ymin;
  ymin = ymax;
  ymax = ym;
end

g = interp1( f, x, linspace( ymin, ymax, yres));
fpert = f;
