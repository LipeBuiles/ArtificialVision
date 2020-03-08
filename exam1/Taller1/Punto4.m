
clc
close all
clear

% Punto 4

MatrizSalida=zeros(20,1024); %1024 es resultado de multiplicar 256pixeles*4(columnas a concatenar)

for i = 1:20 % 20 Imagenes
    imTmp = imread(['Imagen', num2str(i),'.jpg']);
    MatrizSalida(i,1:256) = fHistograma(rgb2gray(imTmp));
    for j=1:3 % Numero de capas RGB
        MatrizSalida(i,1:256*(j+1)) = [MatrizSalida(i,1:256*j) fHistograma(imTmp(:,:,j))];
    end
end

MatrizSalida
size(MatrizSalida)
