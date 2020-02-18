clc
close all
clear

% % (1.)  Utilidad de la ops aritméticas - ejs adicionales
% Bright.jpg, d_GSI.jpg, d_GSI2.gif

imagen1 = imread('scr3.gif');
imagen2 = imread('scr4.gif');

% imagen1 = rgb2gray(imagen1);
% imagen2 = rgb2gray(imagen2);

escalar = 1.5;
imagen1 = imagen1 * escalar;
imagen2 = imagen2 * escalar;

figure,subplot(1,2,1),imshow(imagen1);
       subplot(1,2,2),imshow(imagen2);
       
umbral = 75;
imBW = 0*imagen1;
imBW(imagen1 < umbral) = 255;
imBW(imagen1 >= umbral) = 0;
imBW2 = 0*imagen2;
imBW2(imagen2 < umbral) = 255;
imBW2(imagen2 >= umbral) = 0;

AND = imBW & imBW2;
OR = imBW | imBW2;
X = xor(imBW,imBW2);
NOT = ~imBW;

figure,subplot(1,6,1),imshow(imBW);
       subplot(1,6,2),imshow(imBW2);
       subplot(1,6,3),imshow(AND);
       subplot(1,6,4),imshow(OR);
       subplot(1,6,5),imshow(X);
       subplot(1,6,6),imshow(NOT);