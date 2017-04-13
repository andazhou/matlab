function Cropped = cropToOdd(Img)

% Changes Img to have an odd number of rows and columns, by cropping
% if necessary

[rows, cols] = size(Img);

rows = 2 * floor((rows - 1) / 2) + 1;
cols = 2 * floor((cols - 1) / 2) + 1;

Cropped = Img(1:rows, 1:cols);
end