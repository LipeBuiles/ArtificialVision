clc
close all
clear

%Cargar Imagenes
imagen = imread('Cheetah.jpg'); % Cargar imagen
imagen = rgb2gray(imagen); %validar si se requiere rgb2gray

imagen2 = double(imagen);
 
n = 7;
p = 5;
 
kernelPB = (1/n^2)*ones(n);
imagenPB = conv2(imagen2, kernelPB, 'same');

Ig = imagen2 - imagenPB;
Iu = imagen2 + (p*Ig);
ImaRe = uint8(Iu);

figure,subplot(1,2,1),imshow(imagen); % Mostrar imagenes al mismo tiempo
% subplot(1,3,2),bar(histogramaEntrada);

subplot(1,2,2),imshow(ImaRe);