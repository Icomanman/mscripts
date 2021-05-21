
% fn = function handle - integrand
% interval
% n = no. of subdivisions

function [area, B0] = AdQuad(fn)
  tol = 1 * 10^-5; % constant for this problem
  interval = [0 3]; % constant for this problem
  converged = 0;
    % loop from order 2 (minimum for Boole) to 6 (trial):
    for k = 2 : 6
      n0 = 2^(k - 1); 
      n = 2^k;

      S0 = Simpson(fn, interval, n0);
      Sk = Simpson(fn, interval, n);
      
      err = (Sk - S0) / 15;
     
      if (k == 6 && err > tol)
        fprintf("> %ith Order reached.\n", k);
        fprintf("> err = %f.\n", err);
      end
    
      if (err <= tol)
        B = Sk + err;
        
        if (converged == 0)
          B0 = B; % first value that satisfies the tol
          converged = 1;
        end
      end
      
      plot(k, err, "*");
      hold on;
    end
    
  hold off;
  area = B;
end