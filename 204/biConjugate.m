
% https://en.wikipedia.org/wiki/Biconjugate_gradient_method

% Biconjugate Gradient Method
% n = 300
function x = biConjugate(A, b)
 
	try
		if det(A) ~= 0
			invertible = true;
		end
	catch
		fprintf("> Err: Matrix A is singular.");
  end  
  
  if invertible
    tol = 10^-4;
    n = length(b);
    
    x = -0.05 * ones(n, 1);
    r = b - (A * x);
    rh = r';
    rho = 1;
    
    p = zeros(n, 1);
    
    [~, L2, LInf] = vectorNorm(rh);
    del = 1;
    i = 1;
    lim = 200;
    
    figure("Name", "Convergence vs Iterations");
    
    while del > tol && i < lim
      LInf0 = LInf;
      L20 = L2;
      beta = (rh * r)/ rho;
      
      p = r + (beta * p);
      % ph = rh + (beta * ph);
      ph = p';
      
      v = A * p;
      
      alpha = (rh * r) / (ph * v);
      x = x + (p * alpha);
            
      r = r - (v * alpha);
      rh = r';
      % rh = rh - (v' * alpha);
      
      rho = rh * r;
        
      [~, L2, LInf] = vectorNorm(rh);
      % del = abs(LInf0 - LInf);
      del = abs(L20 - L2);
      i = i + 1;
      
      plot(i, del, "r*", "LineWidth", 1.5);
      xlabel("Iterations");
      ylabel("del");
      hold on;
    end
    
    hold off
  end
  
end