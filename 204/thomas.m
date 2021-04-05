
function [x, omega, conv] = thomas(A, b)
	% tol and omegs are harcoded for this problem
	tol = 10^(-4);
	omegs = (1.0: 0.1: 1.9);
	iterations = length(omegs);
	markers = ['o','+','*','.','x','s','d','_','|','v', '^'];
  
	[~, ~, LInf] = vectorNorm(x_init'); % vectorNorm only accepts a row vector

	try
		if det(A) ~= 0
			invertible = true;
		end
	catch
		fprintf("> Err: Matrix A is singular.");
	end

	if invertible == true
    % figure("Name", "LInf vs Iterations");
		% Loop through different omegs:
    for j = 1 : length(omegs)
      
			diff = 1;
      i = 1; % just in case...
      limit = 250;
      om = omegs(j);

      while diff > tol && i <= limit
      	LInf0 = LInf;

      	diff_DL_inv = (D - (om * LA))^-1;
      	D_om = (1 - om) * D;
      	U_om = om * UA;

      	x = diff_DL_inv * ((om * b) + (U_om + D_om) * x_init);
      	x_init = x;

      	fprintf("After %i iterations: %d\n", i, LInf);

				[~, ~, LInf] = vectorNorm(x_init'); % vectorNorm only accepts a row vector
				diff = abs(LInf0 - LInf);
				
				i = i + 1;
        
        % plot(i, LInf, markers(j));
        % hold on
      end
      
      iterations(j) = i;
			
    end
    % hold off
    
    figure("Name", "Omega vs Iterations");
    plot(omegs, iterations, '*', "LineWidth", 1);
    title("Omega vs Iterations");
    xlabel("Omega");
    ylabel("Iterations");
    
  end
  
  conv = min(iterations);
	idx = iterations == conv;
	omega = idx;
	fprintf("Index: %i\n", idx);
	
end