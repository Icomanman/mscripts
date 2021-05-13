
% y = value at the point of interest
% x = point of interest for interpolation
% X = vector of x data points
% C = Matrix of the polynomials coefficients

function y = cubicSpline(x, X, C)
  n = length(X);
  interval = 0;
  F = cell(n - 1, 1);
  
  interval_found = 0;
  
  for i = 1 : n
    
    % Check if x is within the data points
    if(x < X(1) || x > X(n))  
      fprintf("> err. Value outside of range.\n");
      y = NaN;
      return;
    end
    
    if(x >= X(i) && x <= X(i + 1))
      interval = i;
      interval_found = 1;
      fprintf("> Value is within interval %i.\n", i);
    end
    
    % The Polynomials:
    if(i < n)
      pos = n * (i - 1);
      fx = @(x) (C(pos + 1)*x^3 + C(pos + 2)*x^2 + C(pos + 3)*x + C(pos + 4));
      F{i} = fx;
      
      range = (X(i) : 0.1 : X(i + 1)); 
      fr = ones(length(range), 1);
      
      for j = 1 : length(range)
        fr(j) = fx(range(j));
      end
      
      plot(range, fr, "LineWidth", 2);
      hold on;
    end
    
    if (interval ~= 0 && interval_found == 1)
      y = F{interval}(x);
      % to ensure y only has one value and won't be overwritten
      interval_found = 0;
    end
    
  end
  hold off;
end