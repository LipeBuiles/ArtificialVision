clc
close all
clear

imagen = imread('Apple_1.png');

R=imagen(:,:,1); %Rojo
G=imagen(:,:,2); %Verde
B=imagen(:,:,3); %Rojo

G(:,1:600)=0;
B(:,1:600)=0;

imagen(:,:,2)=G;
imagen(:,:,3)=B;

% figure,subplot(1,2,1),imshow(imagen1);
%        subplot(1,2,2),imshow(imBW);
figure,imagesc(imagen),pbaspect([1 1 1]);       
       
