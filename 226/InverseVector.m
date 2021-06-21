
% Inverse Vector Iteration

function [eig, phi] = InverseVector(K, M, shift)
  
  tol = 10e-4;

  lim = 20;
  err = 1;
  i = 1;
  eig0 = 1;
  
  if (shift > 0)
    % shift the stiffness matrix:
    K = K - (shift * M);
  end
  
  % init values vectors:
  x = ones(length(diag(M)), 1);
  x_bar = (K^-1) * (M * x);
  
  while i <= lim && abs(err) >= tol
    
    eig = (x_bar' * (M * x)) / (x_bar' * (M * x_bar));
   
    if (shift > 0)
      eig = eig + shift;
    end
    
    err = (eig - eig0) / eig;
    eig0 = eig;
    
    x = x_bar / (sqrt(x_bar' * (M * x_bar)));
    x_bar = (K^-1) * (M * x);
    i = i + 1;
  end
  
  phi = x_bar / (sqrt(x_bar' * (M * x_bar)));
  
end