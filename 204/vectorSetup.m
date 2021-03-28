% 28 Mar 2021
% A is the problem's tri-diagonal matrix
% b is the problem's given vector
% n is the size of matrix/vector length
function [A, b] = vectorSetup(n)

  % indices column vector
  idx = [1:n]';
  % initialize h values
  h_el = (1/(n + 1))^2;
  
  % creating vector b:
  b = ones(n, 1) * h_el;
  
  % creating the tri-diagonal matrix A
  A = ones(n);
  LA = tril(A, -1) - tril(A, -2);
  UA = triu(A, 1) - triu(A, 2);
  A = A .* diag(diag(A) * -2);
  A = A + LA + UA;
  end