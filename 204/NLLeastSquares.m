
% X = vector of x data points
% Y = vector of y data points

function [a, b] = NLLeastSquares(X, Y)
  tol = 10^-4;
  n  = length(X);
  fx = @(a, b, x) a * x * exp(b * x);
  
  % partial derivaties:
  dfxa = @(a, b, x) x * exp(b * x);
  dfxb = @(a, b, x) a * (x^2) * exp(b * x);

  % init / containers
  J = zeros(n, 2); 
  r = ones(n, 1);
  delA = zeros(1, 2);
  
  a = 0.25; 
  b = -0.5;
  iter = 0;
  s = 1;
  
  while (s > tol || iter < 50)
    
    for i = 1 : n
      % calculate the residual vector, r:
      r(i, :) = fx(a, b, X(i)) - Y(i);
      
      % The Jacobian Matrix:
      Ji = [dfxa(a, b, X(i)), dfxb(a, b, X(i))];
      J(i, :) = Ji;
    end

    J_t = J';
    Jj = J_t * J;
    p = (Jj^-1) * (-J_t) * r;
    
    sq = abs(r .* r);
    s = sq .+ sq;
    
    a = a + delA(1);
    b = b + delA(2);
    
    iter = iter + 1;
  end
  
end