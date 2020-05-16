clc
close all
clear

%% (1.) ¿Cómo trabaja la función imlabel.m ?

imagen = imread('Hands.jpg');
imagen = rgb2gray(imagen);
         unique(imagen) % Píxeles distintos que tiene la imagen.
         
imagen = imbinarize(imagen); % Se binariza la imagen; el umbral se calcula automáticamente. Método de Otsu
         unique(imagen) 
         figure,colormap('gray'),imagesc(imagen);
        
 imLbld = bwlabel(imagen);
             figure,colormap('gray'),imagesc(imLbld);colorbar
         
         
         