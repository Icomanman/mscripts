
% System of NL Equations: using Newton-Raphson

% a + b + c = -2
% a^2 + b^2 + c^2 = 6
% -abc = -2

%  Try Fixed-Point Iteration:
% a = - (2 + b + c);
% b = 6 - (a^2 + c^2);
% c = 2 / (a * b);

ga = @(a) (-(b^2) - (2*b) - (2/a));
gb = @(b) (6 - (a^2 + (4 / (a^2 * b^2))))^0.5;
gc = @(c) (2 / b * (-b - c - 2));

tol = 1e-4;
lim = 250;
i = 1;
dela = 1;
delb = 1;
delc = 1;

a = 1;
b = 3;
c = 1;

while dela > tol && delb > tol && delc > tol && i < lim
  if a == 0 || b == 0
    continue;
  end  
  an = ga(a);
  bn = gb(b);
  cn = gc(c);
  dela = abs(an - a);
  delb = abs(bn - b);
  delc = abs(cn - c);
  
  a = an;
  b = bn;
  c = cn;
  
  fprintf("At i = %i: a = %d, b = %d, c = %d\n", i, a, b, c);
  
  plot(i, a, '*', "LineWidth", 2);
  hold on
  plot(i, b, 'ro', "LineWidth", 1);
  hold on
  plot(i, c, 'bx', "LineWidth", 1);
  hold on
  
  i = i + 1;
  
end

fprintf("a: %d, b: %d, c: %d\n", a, b, c);
fprintf("dela: %d, delb: %d, delc: %d\n", dela, delb, delc);

hold off