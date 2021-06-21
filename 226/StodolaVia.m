
% Stodola-Vianello
function [eig, phi] = StodolaVia(K, M)
  B = (M^-1) * K;
  tol = 10e-5;
  lim = 20;
  
  % init vector:
  % y0 = ones(length(diag(M)), 1);
  y0 = [1 -1.5 2]';
  
  err = 1;
  i = 1;
  
  while i <= lim && abs(err) >= tol
    
    y = B * y0;
   
    if(min(abs(y)) > 0)
      y = y ./ min(abs(y));
      eig = min(abs(y));      
    end
    
    err = (max(y) - max(y0))/ max(y0);
    y0 = y;
    i = i + 1;
  end
  
  phi = y;
  
end