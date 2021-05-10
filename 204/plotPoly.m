
function plotPoly(X)
  n = length(X);
  
  fx = @(x) -11 + (121/6)*x - (18/2)*x^2 + (4/3)*x^3;
  
  Y = ones(length(X), 1);
  
  for i = 1 : n
    
    Y(i) = fx(X(i));
    
  end
  
  plot(X, Y);
  
end