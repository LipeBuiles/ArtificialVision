
clc
close all
clear

% Punto 1

Medidas=zeros(20,4);
for i = 1:20
    imTmp = imread(['Imagen', num2str(i),'.jpg']);
    imTmp=rgb2gray(imTmp);
    Medidas(i,1:4)= [min(imTmp(:)),mean(imTmp(:)),max(imTmp(:)),std(std(double(imTmp)))];
end

Medidas