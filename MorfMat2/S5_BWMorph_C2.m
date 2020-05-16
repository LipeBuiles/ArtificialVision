clc
close all
clear

lM = imread('M.jpg');
lM = imbinarize(lM);
figure,colormap('gray'),imagesc(lM);
lM = bwmorph(lM,'skel',Inf);

lC = imread('C.png');
lC = rgb2gray(lC);
lC = imbinarize(lC);
       figure,colormap('gray'),imagesc(lC);
lC = ~lC;
lC = bwmorph(lC,'skel',Inf);


% Caracterización - letra M           
 bpM = bwmorph(lM,'branchpoints');
nbpM = length(find(bpM == 1));

 epM = bwmorph(lM,'endpoints');
nepM = length(find(epM == 1));


% Caracterización - letra C           
 bpC = bwmorph(lC,'branchpoints');
nbpC = length(find(bpC == 1));

 epC = bwmorph(lC,'endpoints');
nepC = length(find(epC == 1));

       figure,colormap('gray'),imagesc(lM);
       figure,colormap('gray'),imagesc(lC);

    