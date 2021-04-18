
% a^2 - b = 0
% 8a - 4a^2 +32 - 9b^2 = 0

f1 = @(a,b) (a^2 - b);
f2 = @(a,b) (8*a - 4*a^2 + 32 - 9*b^2);

df1a = @(a) (2*a);
df1b = -1;

df2a = @(a) (8 - (8 * a));
df2b = @(b) (-18 * b);

tol = 10^-8;
lim = 51;
i = 1;
dela = 1;
delb = 1;

a = -1;
b = 1;

while (dela > tol || delb > tol) && i < lim
  
  F = -[f1(a, b), f2(a, b)]';

  J = [ df1a(a), df1b;
        df2a(a), df2b(b)];
      
  x = GaussianElimination(J, F);
  
  an = x(1) + a;
  bn = x(2) + b;

  dela = abs(an - a);
  delb = abs(bn - b);
  
  a = an;
  b = bn;
  
  fprintf("At i = %i: a = %d, b = %d\n", i, a, b);
  
%  plot(i, a, '*', "LineWidth", 2);
%  hold on
%  plot(i, b, 'ro', "LineWidth", 1);
%  hold on

  plot(i, dela, 'b*', "LineWidth", 1.5);
  hold on
  plot(i, delb, 'ro', "LineWidth", 1);
  hold on
  
  i = i + 1;
  
end

fprintf("> i = %i: da = %d, db = %d, \n", i, dela, delb);

hold off

