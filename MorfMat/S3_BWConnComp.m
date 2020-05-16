clc
close all
clear                       %% bwconncomp.m -- Objetos conectados dentro de una imagen

imagen = imread('Stones2.jpg');
         
imagen = imbinarize(imagen);    % ¿# de objetos conectados?
         unique(imagen);     
         figure,colormap('gray'),imagesc(imagen);
         
%% Problema (1): ¿Cómo eliminar ruido en la imagen?

       imgRes = bwareaopen(imagen,10); % ¿# de objetos conectados?
                figure,colormap('gray'),imagesc(imgRes);
       labels = bwlabel(imgRes);                     
                figure,colormap('jet'),imagesc(labels);
                
         ROIs = bwconncomp(imgRes);     % Número de objetos conectados
%          
%          pixeles = ROIs.PixelIdxList{1,51};
%          labels(pixeles) = 0;
%         reg13 = ROIs.PixelIdxList{1,13}; % Índices lineales de la ROI 13
%        
% imgRes(reg13) = 0;  
%                 figure,colormap('gray'),imagesc(imgRes);  
%                