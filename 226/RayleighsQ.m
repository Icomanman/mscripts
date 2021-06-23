
% Rayleigh's Quotient Iteration
function [Eig, Phi] = RayleighsQ(K, M, Shifts)
  
  Eig = zeros(length(diag(M)), 1);
  Phi = zeros(size(M));
  
  for i = 1 : length(Eig)
    
    [lambda, phi] = InverseVector(K, M, Shifts(i));
    Eig(i) = lambda;
    Phi(:, i) = phi;
    
  end
  
end