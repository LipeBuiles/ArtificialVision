%% Punto 3

clc
close all
clear

imagen = imread('HorseLeg.jpg');

% Separamos las componentes de la imagen RGB
R = imagen(:,:,1);
G = imagen(:,:,2);
B = imagen(:,:,3); 

% Separamos las componentes de la imagen RGB
HSV = rgb2hsv(imagen);
H = HSV(:,:,1);
S = HSV(:,:,2);
V = HSV(:,:,3);

minimum = min(min(H)); 
maximum = max(max(H));

% Ponemos los grados centigrados 30 y 31, en grados para obtener el color
ll = 0.0333; % Lower limit
ul = 0.9267; % Upper limit

 Rm = R;
 Gm = G;
 Bm = B;

Rm(H >= ll & H <= ul) = 0;
Gm(H >= ll & H <= ul) = 0;
Bm(H >= ll & H <= ul) = 0; 
RGBm = cat(3,Rm,Gm,Bm);
 
% La parte resultante la convertimos a escala de grises y la umbralizamos
re = rgb2gray(RGBm);
umbral = graythresh(re);
 
imNew = 0 * re; 
imNew(re >= umbral) = 255;
imNew(re < umbral) = 0;

% Quitamos ruido y fusionamos la imagen original con la imagen resultante
imgRes = bwareaopen(imNew,80); 
fusion = imfuse(imagen,imgRes,'blend');
 
 figure, subplot(1,2,1),imshow(imagen),title('Imagen Original');
         subplot(1,2,2),imshow(fusion),title('Imagen Resultante');
 
