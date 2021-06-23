
% Stodola-Vianello
function [lambda, phi] = StodolaVia(K, M)
  B = (M^-1) * K;
  tol = 10e-5;
  lim = 20;
  
  % init vector:
  y0 = ones(length(diag(M)), 1);
	% y0 = [2 -2 1]';
  
  err = 1;
  i = 1;
  
  while i <= lim && abs(err) >= tol
    
    y = B * y0;
    
    if(min(abs(y)) > 0)
      err = (max(y) - max(y0))/ max(y0);
      lambda = min(abs(y)); 
      y = y ./ min(abs(y));
    end
    
    
    y0 = y;
    i = i + 1;
  end
  
  phi = y;
  
end