clear all;
clc;

n=4;
for i=1:n
image=imread(['image' num2str(i) '.jpg']);
A = double(rgb2gray(image));

[U,S,V]=newSvd(A);
noisy_image = imnoise(image, 'gaussian');
A2 = double(rgb2gray(noisy_image));
[U2,S2,V2]=newSvd(A2);

 figure(i);
 set(gcf, 'Name', ['image' num2str(i) '.jpg']);
 subplot(1,2,1);plot(S,'.');title('Original photo');
 subplot(1,2,2); plot(S,'.');title('with noise');
 
end

Compression(double(rgb2gray(imread(('image1.jpg')))));
Compression(double(rgb2gray(imread(('image2.jpg')))));
Compression(double(rgb2gray(imread(('image3.jpg')))));
Compression(double(rgb2gray(imread(('image4.jpg')))));