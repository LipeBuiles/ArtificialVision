clc
close all
clear

imagen = imread('BW_Button.png');
imagenRoja=ones(size(imagen,1),size(imagen,2),3);

capaRoja=imagenRoja(:,:,1);
capaVerde=imagenRoja(:,:,2);
capaAzul=imagenRoja(:,:,3);

capaRoja(imagen>=255)=1;
capaVerde(imagen>=255)=0;
capaAzul(imagen>=255)=0;

imagenRoja(:,:,1)=capaRoja;
imagenRoja(:,:,2)=capaVerde;
imagenRoja(:,:,3)=capaAzul;

figure,subplot(1,3,1),imshow(imagen);
        subplot(1,3,2),imshow(imagenRoja);