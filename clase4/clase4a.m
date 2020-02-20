clc
close all
clear

imagen1 = imread('Calculation.jpg');

%Se pasa a escala de grises o binario, (2 dimensiones) 900x900x3 --->
%900x900
imagen1 = rgb2gray(imagen1);

%Umbralizar
umbral=100;
imBW=0*imagen1;
imBW(imagen1>=umbral)=255;

imBW(1:451,451:end)=0;

% figure,subplot(1,2,1),imshow(imagen1);
%        subplot(1,2,2),imshow(imBW);
figure,colormap('gray'),imagesc(imBW),pbaspect([1 1 1]);       
       
