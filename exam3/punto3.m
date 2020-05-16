clc
close all
clear

% ------------------------------------------------

% Cargamos e imprimiemos la imagen original 
imagen = imread('imagen3.jpg');
         figure,colormap('gray'),imagesc(imagen),title('Imagen Original','Color',[0 1 1]);
         
% Convertimos a escala de grises y recortamos el ancho a 980px         
imagen = rgb2gray(imagen);
imagen = imagen(1:980,:);
         unique(imagen); 
         figure,colormap('gray'),imagesc(imagen),title('Imagen Escala de Grises','Color',[0 1 1]);

% Binarizamos la imagen 
         imagen = imbinarize(imagen);
         unique(imagen);
         figure,colormap('gray'),imagesc(imagen),title('Imagen Binarizada','Color',[0 1 1]);
      
% Eliminizamos el ruido de la imagen         
imgRes = bwareaopen(imagen,500);
imgRes = double(~imgRes);
imgRes = bwareaopen(imgRes,2000);
         imgRes = ~imgRes; 
         figure,colormap('gray'),imagesc(imgRes),title('Imagen sin Ruido','Color',[0 1 1]); 
         

% La operación morfológica abierta, utilizando el mismo elemento estructurante "for" en ambas operaciones.
  
ee = strel('disk',10);          
imgRes = imclose(imgRes,ee);
 
[label] = bwlabel(imgRes);

props = regionprops(label);

imgRes1 = zeros(size(imgRes));

for i = 1:size(props)          
    Area = props(i).Area;
    if(Area > 2000)
        imgRes1(label == i) = 1;           
    else
        imgRes1(label == i) = 2; 
    end             
end

figure,colormap('hot'),imagesc(imgRes1),title('NARANJA: Ramificadas - BLANCAS: No ramificadas','Color',[0.9856 0.7372 0.2537]); 