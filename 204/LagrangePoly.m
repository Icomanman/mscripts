
% y = value at the point of interest
% x = point of interest for interpolation
% X = vector of x data points
% Y = vector of y data points

function y = LagrangePoly(x, X, Y)
  n = length(X);
  sum = 0;
  for i = 1 : n
    product = Y(i);
    for j = 1 : n
      fprintf("init p = %d\n", product);
      if (j ~= i) 
        fprintf("> p = %d * (%d - %d) / (%d - %d)\n", product, x, X(j), X(i), X(j));
        product = (product * (x - X(j))) / (X(i) - X(j));
        fprintf("p = %d\n", product);
      end   
    end
    sum = sum + product;
  end
  y = sum;
end

% fx = @(x) (1.33333333*x^3 - 9.5*x^2 + 20.16666667*x - 11);