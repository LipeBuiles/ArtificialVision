% https://mathcs.clarku.edu/~fdealmeidacoelho/FinalProject/
clc
close all
clear

imagen = imread('SickleCellsB004.jpg'); %  'SickleCellsB004.jpg'
imagen = rgb2gray(imagen);
         figure,colormap('gray'),imagesc(imagen);
         
         
  imBW = imbinarize(imagen);
  imBW = ~imBW;
         figure,colormap('gray'),imagesc(imBW);
         
% Metodología propuesta:                  
    imResp = zeros(size(imagen)); % 

[labels,n] = bwlabel(imBW);
             figure,colormap('jet'),imagesc(labels);
             
             
             for i = 1:n
           
             tmpIm = zeros(size(imagen));
tmpIm(labels == i) = 1;
%                      figure,colormap('jet'),imagesc(tmpIm); 
                     
              circ = regionprops(tmpIm,'Circularity');
              circ = circ.Circularity;
              
              if(circ >= 0.5)
       imResp(labels == i) = 1;           
              end
              
             end
             
                     figure,colormap('gray'),imagesc(imResp); 