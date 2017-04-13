function Img = reconstruct(LP, kern)
% Reconstructs the original image from a Laplacian pyramid given by
% LP.  The parameter LP should have been generated from the
% Laplacian function in Laplacian.m, or be equivalent to such a
% Laplacian pyramid.

numImages = size(LP, 2);

Img = LP{numImages};
for i=numImages-1:-1:1
    Img = Expand(Img, kern) + LP{i};
end
end
