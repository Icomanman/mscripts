
% Modal Expansion
function [q, modes] = modalExp(m, u, phi)
  
  n = length(u);
  q = zeros(n, 1);
  modes = zeros(n, n);
  
  for i = 1 : n
    
    q_top = phi(:, i)' * (m * u);
    q_bot= phi(:, i)' * (m * phi(:, i));
    q(i) = q_top / q_bot;
    modes(:, i) = q(i) * phi(:, i);
    
    % normalize:
%     modes(:, i) = modes(:, i) ./ modes(3, i);
  end
  
end