clc
close all
clear

for i = 1:14
    imTmp = imread(['M', num2str(i),'.tif']);
    figure,imshow(imTmp);
end