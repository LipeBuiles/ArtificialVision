clc
close all
clear

imagen = imread('LC3.jpg'); %cargar la imagen
imagen = rgb2gray(imagen); %validar si se requiere rgb2gray

%calcular minInputIm y maxInputIm
minInputIm = min(min(imagen));
maxInputIm = max(max(imagen));

%definir: minOutIm y maxOutIm
minOutIm = 0;
maxOutIm = 255;

% hallamos la pendiente
m = (maxOutIm - minOutIm) / (maxInputIm - minInputIm);

%hago una copia de la imagen de entrada
resultado = imagen;

for valorPixel = minInputIm:maxInputIm   
    resultado(imagen==valorPixel) = m*(valorPixel - minInputIm) + minOutIm;    
end

histogramaEntrada = fnHistograma(imagen);
histogramaSalida = fnHistograma(resultado);

 figure,subplot(2,2,1),imshow(imagen); title('Imagen de entrada');
        subplot(2,2,2),bar(histogramaEntrada);title('Histograma');
        subplot(2,2,3),imshow(resultado); title('Imagen de salida');
        subplot(2,2,4),bar(histogramaSalida);title('Histograma');