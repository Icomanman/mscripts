%Fixed Point Iteration
% g=@(x)((1-x^2)/2);
% err=1e-6;
% x=1;
% del=1;
% count=0'
% while del>err
%     xn=g(x);
%     del=abs(xn-x);
%     x=xn
%     count=count+1
% end

f = @(x) 10^x + x - 4;
g = @(x) (4 - 10^x);
gg = @(x) (log(4 - x) / log(10));

x = 0;
tol = 1e-4;
lim = 10;
i = 1;
del = 1;

while del > tol && i < lim
  
  xn = f(x);
  plot(x, xn, 'r*', "LineWidth", 1);
  xlabel("x");
  ylabel("xn");
  del = abs(xn - x);
  x = xn;
  
%   plot(i, x, '*', "LineWidth", 2);
%   plot(i, gg(x), 'ro', "LineWidth", 1);
  hold on
  fprintf("x: %d vs f: %d\n", x, f(x));
  i = i + 1;
  
end



for x = -5: 0.5: 5
  
  plot(x, f(x), 'b.');
  hold on
  
end
% 
% for z = 3.95: 0.05: 4.25
%   
%   plot(z, g(z), 'r.');
% 
% end

hold off
