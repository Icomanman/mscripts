
function y = cubicSpline(x, X, C)
  n = length(X);
  interval = 0;
  F = ones(n - 1);
  
  for i = 1 : n
    
    if(x < X(i) || x > X(length(X))     
      fprintf("> err. Value outside of range.\n");
      return
    end
    
    if(x >= X(i) && x <= X(i + 1))
      interval = i;
      fprintf("> Value is within interval %i.\n", i);
    end
    
    % The Polynomials:
    if(i < n)
      pos = i * (n - 1);
      fx = @(x) (C(pos)*x^3 + C(pos + 1)*x^2 + C(pos + 2)*x + C(pos + 3));
      F(i) = fx;
    end
    
  end
  
  y = F{interval}(x);
  
end