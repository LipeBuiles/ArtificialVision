clc
close all
clear

imagen = imread('Stones2.jpg');
         
imagen = imbinarize(imagen);    % ¿# de objetos conectados?
         unique(imagen);     
         figure,colormap('gray'),imagesc(imagen);
         
%% Problema (1): ¿Cómo eliminar ruido en la imagen?

      imgRes = bwareaopen(imagen,10); % ¿# de objetos conectados?
               figure,colormap('gray'),imagesc(imgRes);

%% Problema (2): ¿Cómo hallar el tamaño promedio de las regiones conectadas?

       sizes = fnConnRegCount(imgRes);       
avgStoneSize = floor(mean(sizes));

%% Problema (2): ¿Cómo eliminar ROIs cuyo tamaño sea menor al promedio de las ROI?

  [labels,n] = bwlabel(imgRes);
   
for a = 1:n
    
    tempSize = sizes(a);         % Se accede a valor de ROI temporal.
    if(tempSize <= avgStoneSize) % Se pregunta si su tamaño es menor o igual al promedio.
        
       imgRes(labels == a) = 0;  % Si lo es, esa ROI se suprime en la imagen binaria. 
       
    end
    
end
        figure,colormap('gray'),imagesc(imgRes);

        
intervalo = length(find(imagen >= 0 & imagen <= 1));  


% Borrar ROI que tengan menos de 0.8 de circularidad.

% https://www.mathworks.com/matlabcentral/answers/37262-how-to-round-the-decimals

clc
A = [pi exp(1) 1/7];
Ndecimals = 1; 
f = 10.^Ndecimals; 
A = round(f*A)/f
        
        
% Enfoque 1: función bwconncomp

% connRg = fnConnRegCount(imgRes);