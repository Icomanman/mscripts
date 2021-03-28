
function x = SOR(A, b)
% tol and omegs are harcoded for this problem
	tol = 10^(-4);
  omegs = [1.0: 0.1: 1.9];
  
  % init x:
  x_init = ones(length(b), 1);
  
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
    om = 1;
    
    while diff > tol && limit <= 500
     [~, ~, LInf] = vectorNorm(x_init'); % vectorNorm only accepts a row vector
     LInf0 = LInf;

     sum_DL_inv = (D - (om * LA))^1;
     D_om = (1 - om) * D;
     U_om = om * UA;
     
     x = (sum_DL_inv * (U_om + D_om) * x_init) + ((om * sum_DL_inv) * b);
     x_init = x;
     
     fprintf("After %i iterations: %d\n", limit, x(1));
          
     [~, ~, LInf] = vectorNorm(x_init'); % vectorNorm only accepts a row vector
     diff = abs(LInf0 - LInf);
     limit = limit + 1;
     
     plot(limit, x(1), 'b+', "LineWidth", 2);
     hold on
     
     if diff > 50
       fprintf("break: %d", diff);
      break
     end
     
    end
    
    hold off
  end
  
end