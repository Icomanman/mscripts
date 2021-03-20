function [mod_A, h, x] = vectorSetup(A, n, init_x)

  % indices column vector
  idx = [1:n]';
  % initialize h values
  h = (1 ./ (idx + 1)) .^2;

  % creating the modified matrix A after isolating x values on the left side
  mod_A = zeros(n);
  x_coeff = diag(A);
  x_init = ones(n, 1);
  
  mod_A(1,:) = [h(1), -x_init(2), zeros(1,4)] ./ x_coeff(1);
  mod_A(n,:) = [zeros(1,4), -x_init(n-1), h(n)] ./ x_coeff(n);
  
  for i = 2 : (n-1)
  
    mod_A(i,i) = h(i) / x_coeff(i);
    mod_A(i,i-1) = -x_init(i - 1) / x_coeff(i);
    mod_A(i,i+1) = -x_init(i + 1) / x_coeff(i);

  end
  
  for j = 1:50
  
    mod_A(1,:) = [h(1), -init_x(2), zeros(1,4)] ./ x_coeff(1);
    mod_A(n,:) = [zeros(1,4), -init_x(n-1), h(n)] ./ x_coeff(n);
  
    for i = 2 : (n-1)
  
      mod_A(i,i) = h(i) / x_coeff(i);
      mod_A(i,i-1) = -init_x(i - 1) / x_coeff(i);
      mod_A(i,i+1) = -init_x(i + 1) / x_coeff(i);

    end
    
    init_x = mod_A * h;
    
    plot(init_x(1), j, "*r");
    plot(h(1), j, "-og");
    hold on
    
  end
  hold off
  x = init_x;
  
  
end