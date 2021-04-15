
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
    tol = 1e-4;
    n = length(b);
    
    x =ones(n, 1);
    r = b - (A * x);
    rh = r';
    rho = 1;
    
    p = r;
    ph = r';
    
    LInf = 1;
    i = 1;
    lim = 250;
    
    while LInf > tol && i < lim
      
      beta = (rh * r)/ rho;
      
      p = r + (beta * p);
      ph = rh + (beta * ph);
      
      v = A * b;
      
      alpha = (rh * r) / (ph * v);
      x = x + (p * alpha);
            
      r = r - (v * alpha);
      rh = rh - (v' * alpha);
      
      rho = rh * r;
      [~, ~, LInf] = vectorNorm(rh);
      i = i + 1;
      
      plot(i, LInf, "r.");
      hold on;
    end
    
    hold off
  end
  
end