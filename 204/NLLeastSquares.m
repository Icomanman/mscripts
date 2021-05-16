
% X = vector of x data points
% Y = vector of y data points

function [a, b, s] = NLLeastSquares(X, Y)
  tol = 10^-4;
  n  = length(X);
  fx = @(a, b, x) a * x * exp(b * x);
  
  % partial derivaties:
  dfxa = @(a, b, x) x * exp(b * x);
  dfxb = @(a, b, x) a * (x^2) * exp(b * x);

  % init / containers
  J = zeros(n, 2); 
  r = ones(n, 1);
  p = zeros(1, 2);
  
  a = 3; 
  b = -0.5;
  iter = 0;
  s = 1;
  
  while (s > tol && iter <= 15)
    
    for i = 1 : n
      % calculate the residual vector, r:
      r(i, :) = fx(a, b, X(i)) - Y(i);
      
      % The Jacobian Matrix:
      Ji = [dfxa(a, b, X(i)), dfxb(a, b, X(i))];
      J(i, :) = Ji;
    end

    J_t = J';
    Jj = J_t * J;
    p = (Jj^-1) * ((-J_t) * r);
    
    a = a + p(1);
    b = b + p(2);
    
    sq = abs(r.^2);
    s = sum(sq);
    
    xlabel("iterations");
    
    plot (iter, a, "*", "LineWidth", 1);
    hold on
    plot (iter, b, "o", "LineWidth", 1);
    hold on
    plot (iter, s, "b*", "LineWidth", 1.5);
    hold on
    
    legend("Alpha values", "Beta values", "Sum of the Squares");
    
    iter = iter + 1;
  end
  hold off
end