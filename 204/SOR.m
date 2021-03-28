
function x = SOR(A, b)
% tol and omegs are harcoded for this problem
	tol = 10^(-4);
  omegs = [1.0: 0.1: 1.9];
  
  % init x:
  x = ones(length(b), 1);
  
  LA = tril(A, -1);
  UA = triu(A, 1);
  D = diag(diag(A));
  invertible = false;
  
  try
    if det(A) ~= 0
      invertible = true;
    end
  catch
    fprintf("> Err: Matrix A is singular.");
  end
    
  if invertible == true
    diff = 1;
    limit = 1; % just in case...
    om = 1.1;
    
    while diff > tol && limit <= 500 || x(1) > 1e6
     [~, ~, LInf] = vectorNorm(x'); % vectorNorm only accepts a row vector
     LInf0 = LInf;
     %div = (D + LA)^1; 
     %x = div * (b - ((UA + (0 * D)) * x));
     
     sum_DL_inv = (D - (om * LA))^1;
     D_om =(1 - om) * D;
     U_om = om * UA;
     
     x = (sum_DL_inv * (U_om + D_om) * x) + ((om * sum_DL_inv) * b);
     
     fprintf("After %i iterations: %d\n", limit, x(1));
          
     [~, ~, LInf] = vectorNorm(x'); % vectorNorm only accepts a row vector
     diff = abs(LInf0 - LInf);
     limit = limit + 1;
     
     plot(limit, x(1), "go");
     hold on
    end
    
    hold off
  end
  
end