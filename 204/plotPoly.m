
function plotPoly(X)
  n = length(X);
  
%   fx = @(x) ((4*(x^3)/3) - (18*(x^2)/2) + (121*(x)/6) - 11);
  fx = @(x) (1.33333333*x^3 - 9.5*x^2 + 20.16666667*x - 11);
  Y = ones(length(X), 1);
  
  for i = 1 : n
    
    Y(i) = fx(X(i));
    
  end
 
  plot(X, Y, "LineWidth", 2);
  xlim([-0.5 4.5]);
  ylim([-0.5 4.5]);
  
end