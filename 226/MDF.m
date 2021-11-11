
% MDOF Response
function x = MDF(w, q, phi)
  
  % Free Vibration SDOF:
%   n = length(u);
  % Forced Vibration SDOF:
  n = length(q);
  x = zeros(n, 1);

  for i = 1 : n
    % period = (2 * pi) / w(1);
    % 10
    period = 0.75;
    % 11
    % period = 0.75;
    t = 0 : 0.001: (4 * period);

%     u1 = phi(i, 1) * (u(1) * cos(w(1) * t));
%     u2 = phi(i, 2) * (u(2) * cos(w(2) * t));
%     u3 = phi(i, 3) * (u(3) * cos(w(3) * t));
    
    % 9
    u1 = phi(i, 1) * q(1) * (1 - cos(w(1) * t));
    u2 = phi(i, 2) * q(2) * (1 - cos(w(2) * t));
    u3 = phi(i, 3) * q(3) * (1 - cos(w(3) * t));
%     
    % 10
%     u1 = phi(i, 1) * ((u(1) * cos(w(1) * t)) + (q(1) * (1 - cos(w(1) * t))));
%     u2 = phi(i, 2) * ((u(2) * cos(w(2) * t)) + (q(2) * (1 - cos(w(2) * t))));
%     u3 = phi(i, 3) * ((u(3) * cos(w(3) * t)) + (q(3) * (1 - cos(w(3) * t))));
    
    u = u1 + u2 + u3;
    x(i) = u((4 * period / 0.001) + 1);
    
    % 11
    % u = (k(1) * u1) + (k(2) *  u2) + (k(3) * u3);
    % 12
    % u = (m(1) * w(1)^2 * u1) + (m(2) * w(2)^2 * u2) + (m(3) * w(3)^2 * u3);
    
%     name = "Floor " + i;
%     figure("Name", name);
%     plot(t, u, "LineWidth", 2.5);
%     grid on;
%     xlabel("Time, secs");
%     ylabel("Total Displacement Response, in");
% %     hold on;
%     legend(name);
%     xlim([0 1]);
%     ylim([-0.5 0.5]);
  end
%   legend("Floor 1", "Floor 2", "Floor 3");
%   hold off;
   
end