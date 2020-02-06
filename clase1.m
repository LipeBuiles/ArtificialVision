% Limpiar command window
clc 

% Cerrar ventanas previamente abiertas
close all

clear
% Limpiar (variables en) memoria

% Cargar imaganes
imagen = imread('imagen1.jpg');

%%% Las imagenes a trabajar a escala de grieses y en el workspace si
%%% aparace un x3 es a color

% Para convertir a banco y negro
imagen = rgb2gray(imagen);

% Ops aritmétricas (Imagen + escalar(1 ó 2))
imagen = imagen + 100;

% Mostrar imaganes en variable
figure,imshow(imagen),colorbar;

