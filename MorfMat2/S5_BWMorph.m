clc
close all
clear

Letra = imread('M.jpg');
Letra = imbinarize(Letra);
        figure,colormap('gray'),imagesc(Letra);
Letra = bwmorph(Letra,'skel',Inf); % Implementa funciones de morfología matemática.
        figure,colormap('gray'),imagesc(Letra); 
           
 bp = bwmorph(Letra,'branchpoints');
nbp = length(find(bp == 1));

 ep = bwmorph(Letra,'endpoints');
nep = length(find(ep == 1));

      figure,colormap('gray'),imagesc(Letra);
 
