% Generate Laplacian and Gaussian pyramids for einstein.png

% Initiate image & kern
einstein = imread('einstein.png');
einstein = im2double(einstein);

einstein = rgb2gray(einstein);

% initiate kern
kern = [0.05 0.25 0.40 0.25 0.05];
w = conv2(kern, kern');

% Run Laplacian function with n = 5 layers
n = 5;
[GP, LP] = Laplacian(einstein, w, n);

% % Plot LP for all levels 
% figure(1);
% 
% for i = 1:n+1
%     subplot(2,3,i);
%     imshow(LP{i}, []);
% end
% 
% %Plot GP for all levels
% figure(2);
% 
% for j = 1:n+1
%     subplot(2,3,j);
%     imshow(GP{j}, []);
% end

% expanded = expandktimes(LP{3}, 3, w);
% imshow(expanded, []);
% figure;
% show_band(LP, GP, 'Gaussian', w);
% figure;
% show_band(LP, GP, 'Laplacian', w);
% figure;
% show_band(LP, GP, 'Gaussian_Expand', w);
% figure;
% show_band(LP, GP, 'Laplacian_Expand', w);

% Initiate image & kern for 'marilyn_einstein.jpg'
meinstein = imread('marilyn_einstein.jpg');
meinstein = im2double(meinstein);
meinstein = rgb2gray(meinstein);

% initiate kern
mkern = [0.05 0.25 0.40 0.25 0.05];
mw = conv2(mkern, mkern');

% Run Laplacian function with n = 5 layers

[MGP, MLP] = Laplacian(meinstein, mw, n);
figure;
show_band(MGP, MLP, 'Gaussian_Expand', mw);
