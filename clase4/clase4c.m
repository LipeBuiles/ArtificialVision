clc
close all
clear

imagen = imread('Mandala.jpg');

T=size(imagen);

escalarI=0.25;
escalarII=0.5;
escalarIII=0.75;
escalarIV=1;

imBW=0*imagen;
imBW(:,1:500)=escalarIV;



% R=imagen(:,:,1); %Rojo
% G=imagen(:,:,2); %Verde
% B=imagen(:,:,3); %Rojo
% 
% G(600:end,:)=0;
% B(600:end,:)=0;
% 
% imagen(:,:,2)=G;
% imagen(:,:,3)=B;
% 
% % figure,subplot(1,2,1),imshow(imagen1);
% %        subplot(1,2,2),imshow(imBW);
figure,imagesc(imBW),pbaspect([1 1 1]);       
       
