
function [Y, err] = centralDiff(func, x, H)
  Y = zeros(length(H), 1);
  err = zeros(length(H), 1);
  
  for i = 1 : length(H)
   
    Y(i) = (func(x + H(i)) - func(x - H(i))) / (2 * H(i));
    err(i) = abs(1 - Y(i)); % 1st derivative of e^x at 0 = 1;
  
  end
  
  plot(err, H, "*", "LineWidth", 1.75);
  xlabel("Error");
  ylabel("h");
  
end