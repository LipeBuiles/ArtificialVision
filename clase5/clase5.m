% Imagenes tipo unit8
clc
close all
clear

imagen = imread('venado.jpg');
imagen = rgb2gray(imagen);

histograma = fHistograma(imagen);

figure, subplot(1, 2, 1), imshow(imagen);
subplot(1, 2, 2), bar(histograma);
title('Histograma - Imagen de entrada');
xlabel('Valor - Intensidad de pixel');
ylabel('Frecuencia de aparici�n de pixel');