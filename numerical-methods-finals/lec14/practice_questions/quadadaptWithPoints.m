% MODIFIED FROM THE ORIGINAL CODE `quadadapt.m`

         % EDITED OUTPUT RETURNS
function [q, xpts] = quadadaptWithPoints(f,a,b,tol,varargin)
    % Evaluates definite integral of f(x) from a to b
    if nargin < 4 | isempty(tol),tol = 1.e-6; end
    c = (a + b)/2;
    fa = feval(f,a,varargin{:});
    fc = feval(f,c,varargin{:});
    fb = feval(f,b,varargin{:});
    
    % EDITED
    [q, xpts_sub] = quadstep(f, a, b, tol, fa, fc, fb, varargin{:});
    xpts = [a, b, xpts_sub];
    xpts = sort(xpts)';
end

         % EDITED OUTPUT RETURNS
function [q, xpts_sub] = quadstep(f,a,b,tol,fa,fc,fb,varargin)
    % Recursive subfunction used by quadadapt.
    h = b - a; c = (a + b)/2;
    
    % EDITED
    d = (a+c)/2;
    e = (c+b)/2;
    
    fd = feval(f,(a+c)/2,varargin{:});
    fe = feval(f,(c+b)/2,varargin{:});
    q1 = h/6 * (fa + 4*fc + fb);
    q2 = h/12 * (fa + 4*fd + 2*fc + 4*fe + fb);
    
    if abs(q2 - q1) <= tol
        q = q2 + (q2 - q1)/15;
        % EDITED
        xpts_sub = [d, c, e];
    else
        % EDITED
        [qa, xpts_subA] = quadstep(f, a, c, tol, fa, fd, fc, varargin{:});
        [qb, xpts_subB] = quadstep(f, c, b, tol, fc, fe, fb, varargin{:});
        q = qa + qb;
    
        % EDITED
        xpts_sub = [xpts_subA, c, xpts_subB];
    end
end