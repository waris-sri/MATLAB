function yint = Lagrange(x,y,xx)
    % Lagrange: Lagrange interpolating polynomial
    % yint = Lagrange(x,y,xx): Uses an (n - 1)-order
    % Lagrange interpolating polynomial based on n data points
    % to determine a value of the dependent variable (yint) at
    % a given value of the independent variable, xx.
    % input:
    % x = independent variable
    % y = dependent variable
    % xx = value of independent variable at which the
    % interpolation is calculated
    % output:
    % yint = interpolated value of dependent variable
    format short
    n = length(x);
    if length(y)~=n, error('x and y must be same length'); end
    s = 0;
    for i = 1:n
        product = y(i);
        for j = 1:n
            if i ~= j
                product = product.*(xx-x(j))/(x(i)-x(j))
            end
        end
        fprintf("Combined product %d: %f\n", i, product)
        s = s+product;
    end
    yint = s;
end