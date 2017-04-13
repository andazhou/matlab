function ReducedImage = reduce(I, w)

% Reduces the image to half its size
%
% Takes in the image I of type double and the 2D filter w that we
% will use to reduce the size of I.  This requires that w meet
% all the requirements for a Gaussian pyramid filter.
%
% Note that, since this routine can only work with images with
% odd numbers of rows and columns, the image I will have its
% right column/bottom row cropped off if the corresponding
% dimension is an even number.

[rows, cols] = size(I);

% Handle possibility of even-dimensioned image
rows = 2 * floor((rows - 1) / 2) + 1;
cols = 2 * floor((cols - 1) / 2) + 1;
I = I(1:rows, 1:cols);

% Perform the filtering operation
LargeFiltered = conv2(I, w, 'same');

% Keep only every other pixel in each direction
ReducedImage = reshape(LargeFiltered(1:2:end, 1:2:end), ...
    (rows+1)/2, (cols+1)/2);
end
