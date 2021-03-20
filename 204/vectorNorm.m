function [L1, L2, LInf] = vectorNorm(v) 

% Check if there's an actual input
if ~exist('v', "var")
    fprintf("> ERROR: Please input a proper vector.\n");
    return;
end

% Check if it's empty or a scalar
if length(v) < 2 || isempty(v)
    fprintf("> ERROR: Please input a proper vector.\n");
    %L1 = NaN; L2 = NaN; LInf = NaN;
    return;
else
    % otherwise, if it is a matrix
    [row, ~] = size(v);
    if row > 1
        fprintf("> ERROR: Please input a proper vector.\n");
        return;
    end
end

L1 = sum(v);
L2 = sqrt(sum(v .^2));
LInf = max([abs(min(v)), max(v)]);

end