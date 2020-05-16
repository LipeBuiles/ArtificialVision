clc
close all
clear

% bwmorph y con regionprops

lM = imread('M.jpg');
lM = imbinarize(lM);
     figure,colormap('gray'),imagesc(lM);
       
lM = bwmorph(lM,'skel',Inf);

lW = imread('W.jpg');
lW = rgb2gray(lW);
lW = imbinarize(lW);
     figure,colormap('gray'),imagesc(lW);      

lW = bwmorph(lW,'skel',Inf);


% % Caracterización - letra M           
 bpM = bwmorph(lM,'branchpoints');
nbpM = length(find(bpM == 1));

 epM = bwmorph(lM,'endpoints');
nepM = length(find(epM == 1));


% % Caracterización - letra W           
 bpW = bwmorph(lW,'branchpoints');
nbpW = length(find(bpW == 1));

 epW = bwmorph(lW,'endpoints');
nepW = length(find(epW == 1));

       figure,colormap('gray'),imagesc(lM);
       figure,colormap('gray'),imagesc(lW);