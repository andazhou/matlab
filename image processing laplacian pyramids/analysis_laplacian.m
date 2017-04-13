% Image splining between two images (image A and image B)

% Initiate images, kern w, and size n
n = 5;
kern = [0.05 0.25 0.40 0.25 0.05];
w = conv2(kern, kern');

% Separate RGB channels of each image
imA = imread('apple.png');
imA = im2double(imA);
imA_R = imA(:,:,1);
imA_G = imA(:,:,2);
imA_B = imA(:,:,3);

imB = imread('orange.png');
imB = im2double(imB);
imB_R = imB(:,:,1);
imB_G = imB(:,:,2);
imB_B = imB(:,:,3);

[imAx, imAy] = size(imA_R);
N = log2(imAx - 1);

% Construct Laplacian pyramids for each image and color band

% Red
[GA, LA] = Laplacian(imA_R, w, n);
[GB, LB] = Laplacian(imB_R, w, n);

for l = 1:n+1
    cL = 2^(N-l);
    LS_R{l} = zeros(size(LA{l}));
    LS_R{l}(:, 1:cL-2) = LA{l}(:, 1:cL-2);
    LS_R{l}(:, cL-1) = 0.75 * LA{l}(:, cL-1) + 0.25 * LB{l}(:, cL-1);
    LS_R{l}(:, cL) = 0.5 * LA{l}(:, cL) + 0.5 * LB{l}(:, cL);
    LS_R{l}(:, cL+1) = 0.25 * LA{l}(:, cL+1) + 0.75 * LB{l}(:, cL+1);
    LS_R{l}(:, cL+2:end) = LB{l}(:, cL+2:end);
    
end

AO_R = reconstruct(LS_R, w);

% Green
[GA, LA] = Laplacian(imA_G, w, n);
[GB, LB] = Laplacian(imB_G, w, n);

for l = 1:n+1
    cL = 2^(N-l);
    LS_G{l} = zeros(size(LA{l}));
    LS_G{l}(:, 1:cL-2) = LA{l}(:, 1:cL-2);
    LS_G{l}(:, cL-1) = 0.75 * LA{l}(:, cL-1) + 0.25 * LB{l}(:, cL-1);
    LS_G{l}(:, cL) = 0.5 * LA{l}(:, cL) + 0.5 * LB{l}(:, cL);
    LS_G{l}(:, cL+1) = 0.25 * LA{l}(:, cL+1) + 0.75 * LB{l}(:, cL+1);
    LS_G{l}(:, cL+2:end) = LB{l}(:, cL+2:end);
    
end

AO_G = reconstruct(LS_G, w);

% Blue
[GA, LA] = Laplacian(imA_B, w, n);
[GB, LB] = Laplacian(imB_B, w, n);

for l = 1:n+1
    cL = 2^(N-l);
    LS_B{l} = zeros(size(LA{l}));
    LS_B{l}(:, 1:cL-2) = LA{l}(:, 1:cL-2);
    LS_B{l}(:, cL-1) = 0.75 * LA{l}(:, cL-1) + 0.25 * LB{l}(:, cL-1);
    LS_B{l}(:, cL) = 0.5 * LA{l}(:, cL) + 0.5 * LB{l}(:, cL);
    LS_B{l}(:, cL+1) = 0.25 * LA{l}(:, cL+1) + 0.75 * LB{l}(:, cL+1);
    LS_B{l}(:, cL+2:end) = LB{l}(:, cL+2:end);
    
end

AO_B = reconstruct(LS_B, w);

subplot(1,3,1);
imshow(AO_R,[]);
title('Red channel');
subplot(1,3,2);
imshow(AO_G,[]);
title('Green channel');
subplot(1,3,3);
imshow(AO_B,[]);
title('Blue channel');
figure;
AO = cat(3, AO_R, AO_G, AO_B);
imshow(AO);