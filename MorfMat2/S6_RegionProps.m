clc
close all
clear
                                  % regionprops.m
  i1 = imread('Apple.jpg');
  i1 = rgb2gray(i1);        
  i1 = imbinarize(i1);

  i2 = imread('Pear.jpg');
  i2 = rgb2gray(i2);        
  i2 = imbinarize(i2);  
  
       figure,subplot(1,2,1),colormap('gray'),imagesc(i1),pbaspect([1 1 1]);
            subplot(1,2,2),colormap('gray'),imagesc(i2),pbaspect([1 1 1]);  
  

%% Etapa 1: remoción de ROI no relevantes para caracterización 
% Proponga una secuencia de instrucciones para dejar solamente las ROI más 
% grandes de cada imagen. Use para este propósito imlabel.m o bwconncomp.m

nada = bwconncomp(i1); % 1956 - ROI dentro de la manzana
jojo = bwconncomp(i2); % 2886  - ROI dentro de la hoja de la pera

  i1 = bwareaopen(i1,2000);  % Borrar la región interior dentro de la manzana.
  i2 = bwareaopen(i2,3000);
  
  i1 = ~i1;
  i2 = ~i2;

  
nada = bwconncomp(i1); % Objetos en imagen Apple.jpg : 66495 3244 y 7163 
jojo = bwconncomp(i2); % Objetos en imagen Pear.jpg  : 124356 10283 y 2465

  i1 = bwareaopen(i1,60000);
  i2 = bwareaopen(i2,12000);
  
%% Etapa 2: caracterización
% Extraiga un vector con 3 características para cada silueta.

       figure,subplot(1,2,1),colormap('gray'),imagesc(i1),pbaspect([1 1 1]);
            subplot(1,2,2),colormap('gray'),imagesc(i2),pbaspect([1 1 1]);
            
% Circularidad de las dos imágenes            
circApple = regionprops(i1,'Circularity') 
 circPear = regionprops(i2,'Circularity')

%% Etapa 3: Caracterización extendida            
% Opciones disponibles: centroid
%                       circularity
%                       MajorAxisLength
%                       MinorAxisLength
%                       Orientation
%                       Perimeter
%                       Area
%
%                       Extent:	    Ratio of pixels in the region to pixels
%                                   in the total bounding box, returned as 
%                                   a scalar. Computed as the Area divided 
%                                   by the area of the bounding box.


% Bounding box - imagen manzana
bbApple = regionprops(i1);
          figure,colormap('gray'),imagesc(i1);
          rectangle('Position',[bbApple.BoundingBox(1),bbApple.BoundingBox(2),bbApple.BoundingBox(3),...
                                bbApple.BoundingBox(4)],'EdgeColor','r','LineWidth',2);


