
% Stodola Method
function [lambda, phi] = Stodola(K, M)
  
  err = 1;
  tol = 10e-4;
  
  lim = 20;
  i = 1;
  n = length(diag(M));
  
  % init vector:
  x = ones(n, 1);
  inert = zeros(n, 1);
  spingf = zeros(n, 1);
  spingd = zeros(n, 1);
  norm0 = 1;
  
  while i <= lim && abs(err) >= tol
    
    for j = 1 : n
      inert(j) = M(j, j) * x(j);
    end
    
    % Q
    springf(3) = inert(3);
    springf(2) = inert(2) + springf(3);
    springf(1) = inert(1) + springf(2);
    
    % del
    springd(1) = springf(1) / K(1, 1);
    springd(2) = (springf(2) / K(2, 2)) + springd(1);
    springd(3) = (springf(3) / K(3, 3)) + springd(2);
    
    d_sum = sum(springd);
    
    x = [springd(1)/springd(3), springd(2)/springd(3), springd(3)/springd(3)]';
    norm = sqrt(springd(1)^2 + springd(2)^2 + springd(3)^2);
    
    err = (norm - norm0) / norm0;
    norm0 = norm;
    
  end
  
  phi = x;
  lambda = sqrt(sum(phi) / d_sum);
  
end