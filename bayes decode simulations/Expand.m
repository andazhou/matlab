function [ ExpandedImage ] = Expand(Img,Filter2D)

% Expands the image to twice its size
% Takes in the image (Img) of type double and the 2D filter (w) used to reduce it to its present
% size
% If input Image size is (R+1,C+1) Expanded image size is (2R+1, 2C+1)

R=size(Img,1);
% Insert empty columns between present columns

Buffer1=[Img;0*Img];
Buffer1=reshape(Buffer1,R,[]);
Buffer1(:,end)=[];

%Insert empty rows between present rows

Buffer1=Buffer1';
R=size(Buffer1,1);
Buffer2=[Buffer1;0*Buffer1];
Buffer2=reshape(Buffer2,R,[]);
Buffer2(:,end)=[];

Buffer2=Buffer2';

% Now we have an image with 2R+1 rows and 2C+1 columns
% Convolving should fill the empty nodes/pixels with a weighted sum of its neighbors 

ExpandedImage=4*(conv2(Buffer2,Filter2D,'same'));


end
