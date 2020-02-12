% Limpiar command window
clc 

% Cerrar ventanas previamente abiertas
close all

clear
% Limpiar (variables en) memoria

% Variables
fila = 168;
columna = 300;

% Cargar imaganes
imagen1 = imread('imagen1.jpg');

%%% Las imagenes a trabajar a escala de grieses y en el workspace si
%%% aparace un x3 es a color

% Para convertir a banco y negro
imagen1 = rgb2gray(imagen1);

% Ops aritmétricas (Imagen + * escalar(1 ó 2)) - Modificar la tonalidad y
% constraste de una imagen
% imagen1 = imagen1 * 2;

% Mostrar imaganes en variable
figure,imshow(imagen1),colorbar;

imagen2 = imread('imagen2.jpg');
imagen2 = rgb2gray(imagen2);
figure,imshow(imagen2),colorbar;

% Recortar imagenes
imagen1 = imagen1(1:fila,1:columna);

imagen1 = double(imagen1);
imagen2 = double(imagen2);

% Constante entre 0 y 1
k = 0.9;

suma_ponderada = (k*imagen1) + ((1-k)*imagen2);
figure,colormap('gray'),imagesc(suma_ponderada);

% Calcular el tamaño de una imagen
[num_filas, num_columnas] = size(imagen1);
[num_filas, num_columnas] = size(imagen2);

% Cargar varias imagenes
imagen3 = imread('imagen3.jpg');
imagen4 = imread('imagen4.jpg');
subplot(1,2,1), imshow(imagen3)
subplot(1,2,2), imshow(imagen4)


% Operador inverso maximo(imagen)-imagen
% MaximoM=max(max(imagen))





