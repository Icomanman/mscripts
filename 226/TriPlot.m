function TriPlot(psv, T, norm)
  
  n = length(psv);
  C1 = zeros(n, 1);
  C2 = zeros(n, 1);
  
  x = zeros(n, 1);
  y = zeros(n, 1);
  b = zeros(n, 1);
  
  for i = 1 : n
    C1(i) = 2 * pi * psv(i) / T(i);
    C2(i) = psv(i) * T(i);
    
    x(i) = log(T(i));
   
    b(i) = log(C1(i) / (2 * pi));
    
    % y(i) = x(i) + b(i);
    y(i) = exp(x(i) + b(i));
    
%     diff = log(psv(i) - log(2 * pi / T(i)));
%     d(i) = log(diff);
    
  end
  
  loglog(T, y, "LineWidth", 3);
  hold on;
  Tripartite;
  % grid on;

  xlabel("Tn, sec");
  xlim([0.02 50]);
  
  if (norm == 1)
    xticks([0.02 0.05 0.1 0.2 0.5 1 2 5 10 20 50]);
    yticks([0.02 0.05 0.1 0.2 0.5 1 2]);
    ylabel("V / PGV");
    ylim([0.02 5]);
  else
    xticks([0.02 0.05 0.1 0.2 0.5 1 2 5 10 20 50]);
    yticks([0.2 0.5 1 2 5 10 20 50 100]);
    ylabel("V, in/sec");
    ylim([0.2 100]);
  end 
  
end