
function [sum, coeff] = LagrangePoly(x, X, Y)
  n = length(X);
  coeff = ones(n, 1);
  sum = 0;
  for i = 1 : n
    product = Y(i);
    for j = 1 : n
%       fprintf("init p = %d\n", product);
      if (j ~= i) 
%         fprintf("> p = %d * %d - %d / (%d - %d)\n", product, x, X(j), X(i), X(j));
        product = (product * (x - X(j))) / (X(i) - X(j));
%         fprintf("p = %d\n", product);
      end   
      coeff(i) = product;
    end
    sum = sum + product;
  end
  
end