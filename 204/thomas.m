
function x = thomas(A, b)
	try
		if det(A) ~= 0
			invertible = true;
		end
	catch
		fprintf("> Err: Matrix A is singular.");
	end

	if invertible == true

    [n, ~] = size(A);
    LA = tril(A, -1);
    UA = triu(A, 1);
    DA = diag(A);
    
    % vectors of diagonals
    e = diag(LA, -1);
    f = DA;
    g = diag(UA, 1);

    for i = 1 : (n - 1)
      % Forward Substitution
      e(i) = e(i) / f(i);
      f(i + 1) = f(i + 1) - (e(i) * g(i));
      b(i + 1) = b(i + 1) - (e(i) * b(i));
    end
    
    x(n) = b(n) / f(n);
    
    for j = (n - 1) : -1 : 1
      % Back Substitution
      x(j) = (b(j) - (g(j) * x(j + 1))) / f(j);
    end
    
  end
	
end