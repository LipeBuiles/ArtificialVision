
%% Punto 1 del Talle 2
%{
Implemente una función en Matlab, para calcular un histograma modificado de una imagen.
En vez de frecuencias de valores de píxel, el histograma modificado debe contar frecuencias de: valores
de desviación estándar normalizada, medidos a nivel local.
Para verificar que los códigos funcionan es necesario:
1. Transformar una imagen en escala de grises utilizando la función stdfilt.m de Matlab.
2. Normalizar la imagen resultante del paso 1, para restringir sus valores de píxel al rango: [0.0, 0.9].
Esta es la imagen que deben pasarle a la función implementada.
La función debe retornar un vector fila de longitud 10. Cada columna debe almacenar la frecuencia con
que aparece un valor de píxel, según el ejemplo de la Tabla 1.
%}

%% Inicio ---------------------------------------------------------------------------------
clc
close all
clear

%% Cargamos imagen ------------------------------------------------------------------------
imagen = imread('Antioquia.jpg');

%% Tratamos la imagen ---------------------------------------------------------------------
imagenGris = rgb2gray(imagen); % Convertimos a escala de grises.
imagenGris=double(imagenGris); % Convertimos los valores tipo double.
imagenFiltrada = stdfilt (imagenGris); %Transformación en valores de desviacion estandar.
imagenFiltrada=rescale(imagenFiltrada,0,0.9); % Reescalamos imagen entre 0 y 0.9
imagenFiltrada=round(imagenFiltrada,1); % Redondeamos valor de la imagen

%% Cálculo de frecuencias para histograma -------------------------------------------------
histogramaImagen = fnHistograma(imagen);
histogramaimagenNormalizada = fnHistogramaMod(imagenFiltrada);

disp('El vector de frencuencias de pixel es:');
disp(histogramaimagenNormalizada);

%% Grafiquemos -----------------------------------------------------------------------------
 figure,subplot(2,2,1),imshow(imagen); title('Imagen Original');
        subplot(2,2,2),bar(histogramaImagen);title('Histograma imagen original');
        subplot(2,2,3),imshow(imagenFiltrada); title('Imagen Procesada');
        subplot(2,2,4),bar(histogramaimagenNormalizada);title('Histograma imagen procesada');
        