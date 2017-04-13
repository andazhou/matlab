
function [GP, LP] = Laplacian(image, w, n)
% image is input grayscale image
% w is kern
% n is level for Laplacian pyramid
% GP & LP are cell arrays

n = n + 1;
% include top layer

GP = cell(1, n);
LP = cell(1, n);

% GP
GP{1} = cropToOdd(image);
for i = 2:n
    GP{i} = reduce(GP{i-1}, w);
end

%LP
LP{n} = GP{n};
for j = (n-1):-1:1
    LP{j} = cropToOdd(GP{j}) - Expand(GP{j + 1}, w);
end
end
