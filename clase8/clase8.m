clc
close all
clear

imagen = imread('Terrazzo_BW1.jpg');
imagen2 = imread('Photograph7.jpg');
imagen3 = imread('Photograph7.jpg');
imagen1 = imread('Terrazzo_BW1.jpg');
imagen = rgb2gray(imagen);
imagen2 = rgb2gray(imagen2);
imagen3 = rgb2gray(imagen3);

minInputIm = min(min(imagen3));
maxInputIm = max(max(imagen3));

minOutIm = 0;
maxOutIm = 255;

m = (maxOutIm - minOutIm) / (maxInputIm - minInputIm);

resultado = imagen3;

for valorPixel = minInputIm:maxInputIm
    resultado(imagen3 == valorPixel) = m*(valorPixel - minInputIm) + minOutIm;
end

% Operador del gradiente
GXsobel = [-1 0 1; -2 0 2; -1 0 1];
GYsobel = [-1 -2 -1; 0 0 0; 1 2 1];
GXprewitt = [-1 0 1; -1 0 1; -1 0 1];
GYprewitt = [-1 -1 -1; 0 0 0; 1 1 1];

% Filtrado pasa-bajos para atenuar ruido
n=5;
kernelPB = (1/n^2)*ones(n);
imagen = conv2(imagen,kernelPB,'same');

histograma = fHistograma(imagen);

umbral = 100;
imBW = 0*imagen;
imBW(imagen >= umbral) = 255;

cont = [imagen3 resultado];

figure,subplot(1,2,1),imshow(imagen2);
                      subplot(1,2,2),imshow(cont);
                        
