clc
close all
clear              % bwareaopen.m

imagen = imread('stonePattern4.jpg');
imagen = rgb2gray(imagen);

  imIv = max(max(imagen)) - imagen;
         figure,colormap('gray'),imagesc(imIv);title('Imagen inversa');
  
         figure,colormap('gray'),imagesc(imagen);title('Imagen original e.g.');

imagen = imbinarize(imagen);    % ¿# de objetos conectados?
         unique(imagen);     
         figure,colormap('gray'),imagesc(imagen);title('Imagen binaria');
        
%% Problema (1): ¿Cómo eliminar ruido en la imagen?

      imgRes = bwareaopen(imagen,500); % ¿# de objetos conectados?  
               figure,colormap('gray'),imagesc(imgRes);title('Imagen tras remover objetos pequeños');
               
      imgRes = double(~imgRes);         
      imgRes = bwareaopen(imgRes,2000); % ¿# de objetos conectados?  
               figure,colormap('gray'),imagesc(imgRes);title('Imagen tras remover objetos pequeños');                      
      
%       [imLbld,n] = bwlabel(imgRes);         
               
% The morphological open operation is an erosion followed by 
% a dilation, using the same structuring element for both operations.               
               
         ee = strel('disk',5);          
     imgRes = double(imopen(imgRes,ee));
              figure,colormap('gray'),imagesc(imgRes); 

          
               
               
% bwareopen.m suprime regiones de píxeles conectados de menos de x píxeles.              