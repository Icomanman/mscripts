
function [x, omega, conv] = SOR(A, b)
	% tol and omegs are harcoded for this problem
	tol = 10^(-4);
	omegs = (1.0: 0.1: 1.9);
	iterations = length(omegs);
	markers = ['o','+','*','.','x','s','d','_','|','v', '^'];

	% init x:
	x_init = ones(length(b), 1);
	[~, ~, LInf] = vectorNorm(x_init'); % vectorNorm only accepts a row vector

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
				
				%plot(i, LInf, markers(j));
				%hold on

				i = i + 1;
      end

			plot(omegs(j), i, 'ro', "LineWidth", 1);
			iterations(j) = i;
			hold on

		end
		hold off

  end
  
  conv = min(iterations);
	idx = iterations == conv;
	omega = idx;
	fprintf("Index: %i\n", idx);
	
end