clc
close all
clear

Batman = imread('Batman.png');
imagen = imread('Batman.png');
imagen = rgb2gray(imagen);
imagen = double(imagen);

% Operador del gradiente
GXsobel = [-1 0 1; -2 0 2; -1 0 1];
GYsobel = [-1 -2 -1; 0 0 0; 1 2 1];
GXprewitt = [-1 0 1; -1 0 1; -1 0 1];
GYprewitt = [-1 -1 -1; 0 0 0; 1 1 1];


% Filtrado para detectar bordes
Gx = conv2(imagen, GXsobel,'Same');
Gy = conv2(imagen, GYsobel,'Same');
MG = sqrt((Gx.^2) + (Gy.^2));

% Filtrado pasa-bajos para atenuar ruido
kernelPB = (1/49)*ones(7);
imagen1 = conv2(imagen,kernelPB,'same');
Gx = conv2(imagen1, GXsobel,'Same');
Gy = conv2(imagen1, GYsobel,'Same');
MG1 = sqrt((Gx.^2) + (Gy.^2));


figure,subplot(1,3,1),colormap('gray'),imagesc(MG);
                        pbaspect([1 1 1]);
                        subplot(1,3,2),colormap('gray'),imagesc(MG1);
                        pbaspect([1 1 1]);
                        subplot(1,3,3),imshow(Batman);
