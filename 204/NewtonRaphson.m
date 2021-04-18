
% System of NL Equations: using Newton-Raphson

% Given:
% a + b + c = -2
% a^2 + b^2 + c^2 = 6
% -abc = -2

fa = @(a, b, c) (a + b + c + 2);
fb = @(a, b, c) (a^2 + b^2 + c^2 - 6);
fc = @(a, b, c) ((a * b * c) + 2);

% Partial derivatives:
dfa1 = 1;
dfa2 = @(a) (2 * a);
dfa3 = @(b,c) (b * c);

dfb1 = 1;
dfb2 = @(b) (2 * b);
dfb3 = @(a,c) (a * c);

dfc1 = 1;
dfc2 = @(c) (2 * c);
dfc3 = @(a,b) (a * b);

tol = 10^-4;
lim = 51;
i = 1;
dela = 1;
delb = 1;
delc = 1;

a = 10;
b = -2.7;
c = 0.7;

while (dela > tol || delb > tol || delc > tol) && i < lim
  
  F = -[fa(a, b, c), fb(a, b, c), fc(a, b, c)]';

  J = [ dfa1,       dfb1,       dfc1; 
        dfa2(a),    dfb2(b),    dfc2(c); 
        dfa3(b,c),  dfb3(a,c),  dfc3(a,b)];
      
%   x = thomas(J, F);
  x = GaussianElimination(J, F);
  
  an = x(1) + a;
  bn = x(2) + b;
  cn = x(3) + c;

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

  plot(i, dela, 'b*', "LineWidth", 1.5);
  hold on
  plot(i, delb, 'ro', "LineWidth", 1);
  hold on
  plot(i, delc, 'k.', "LineWidth", 3);
  hold on;
  
  i = i + 1;
  
end

fprintf("> i = %i: da = %d, db = %d, dc = %d\n", i, dela, delb, delc);

hold off