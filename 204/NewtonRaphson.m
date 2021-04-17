
% System of NL Equations: using Newton-Raphson

% Given:
% a + b + c = -2
% a^2 + b^2 + c^2 = 6
% -abc = -2

fa = @(a) (a + b + c + 2);
fb = @(b) (a^2 + b^2 + c^2 - 6);
fc = @(c) ((a * b * c) + 2);

% Partial derivatives:
dfa1 = @(a) (b + c + 3);
dfa2 = @(a) ((2 * a) + b^2 + c^2);
dfa3 = @(a) (b * c);

dfb1 = @(b) (a + c + 3);
dfb2 = @(b) ((2 * b) + a^2 + c^2);
dfb3 = @(b) (a * c);

dfc1 = @(c) (a + b + 3);
dfc2 = @(c) ((2 * c) + a^2 + b^2);
dfc3 = @(c) (a * b);

tol = 1e-4;
lim = 100;
i = 1;
dela = 1;
delb = 1;
delc = 1;

a = 0.5
b = -2
c = 2

while dela > tol && delb > tol && delc > tol && i < lim
  
  F = -[fa(a), fb(b), fc(c)]';
  J = [dfa1(a), dfa2(a), dfa3(a); 
      dfb1(b), dfb2(b), dfb3(b); 
      dfc1(c), dfc2(c), dfc3(c)];
      
%  dX = thomas(J, F);
  dX = GaussianElimination(J, F);
  
  an = dX(1) + a;
  bn = dX(2) + b;
  cn = dX(3) + c;

  dela = abs(an - a);
  delb = abs(bn - b);
  delc = abs(cn - c);
  
  a = an;
  b = bn;
  c = cn;
  
  fprintf("At i = %i: a = %d, b = %d, c = %d\n", i, a, b, c);
  
%  plot(i, a, '*', "LineWidth", 2);
%  hold on
%  plot(i, b, 'ro', "LineWidth", 1);
%  hold on
%  plot(i, c, 'bx', "LineWidth", 1);
%  hold on

  plot3(a, b, c);
  hold on;
  
  i = i + 1;
  
end

%fprintf("a: %d, b: %d, c: %d\n", a, b, c);
%fprintf("dela: %d, delb: %d, delc: %d\n", dela, delb, delc);

hold off