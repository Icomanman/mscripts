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

% 10^x + x - 4 = 0
g = @(x) (4 - 10^x);
gg = @(x) (log(4 - x) / log(10));

x = -1;
tol = 1e-4;
lim = 200;
i = 1;
del = 1;

while del > tol && i < lim
  
  xn = gg(x);
  del = abs(xn - x);
  x = xn;
  
  plot(i, x, '*', "LineWidth", 2);
  plot(i, gg(x), 'ro', "LineWidth", 1);
  hold on
  fprintf("x: %d vs gg: %d\n", x, gg(x));
  i = i + 1;
  
end



% for x = 3.95: -0.05: 0
%   
%   plot(x, g(x), 'b.');
%   hold on
%   
% end
% 
% for z = 3.95: 0.05: 4.25
%   
%   plot(z, g(z), 'r.');
% 
% end

hold off
