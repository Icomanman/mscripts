
function x = thomas(A, b)

% tol and omegs are harcoded for this problem
	tol = 10^(-4);
  % init x:
  x_init = ones(length(b), 1);
  [~, ~, LInf] = vectorNorm(x_init'); % vectorNorm only accepts a row vector

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
    limit = 1;
  
    while diff > tol && limit <= 500
      
      
      
    end
  end
end