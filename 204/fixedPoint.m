% Fixed Point Iteration

f = @(x) (log(4 - x) / log(10)); % convergent
g = @(x) (10^x + (2 * x) - 4); % divergent
h = @(x) (4 - 10^x); % no solution

x = 0;
tol = 10^-5;
lim = 100;
i = 1;
del = 1;

figure("Name", "x values and Iterations");

while del > tol && i < lim
  
  xn = h(x);
  
  plot(i, del, 'b*', "LineWidth", 2);
  hold on
  plot(i, x, 'ro', "LineWidth", 1.5);
  xlabel("Iterations");
  ylabel("x - values / convergence");
  legend("convergence", "x - values");
  grid on;
  
  del = abs(xn - x);
  x = xn;

  i = i + 1;
  
end

hold off
