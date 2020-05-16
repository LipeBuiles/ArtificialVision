clc;
clear All;
close;

imagen = imread('imgP2.jpg');
ImgOrinal = imagen;
imagen = rgb2gray(imagen);
imagen = imagen(1:528,:);

% Aplicamos filtro
Hx = [-1 0 1; -2 0 2; -1 0 1];
Hy = [-1 -2 -1; 0 0 0; 1 2 1];
n = 5; 
kernelPB = (1/n^2)*ones(n);
imagenPB = conv2(imagen, kernelPB, 'same');

Gx = conv2(imagenPB, Hx, 'same');
Gy = conv2(imagenPB, Hy, 'same');
MG1 = sqrt((Gx.^2) + (Gy.^2));

%Umbralizar
umbral = 110;
imBW = 0*imagenPB; %Vuelvo la imagen igual a las dimesiones y todos los valores en 0 en negro

imBW(imagenPB >= umbral) = 255;

imBW = ~imBW;
imgRes = bwareaopen(imBW,500);

%obtenemos el número de regiones de celulas enfermas
connRegs = bwconncomp(imgRes);
numRegs = connRegs.NumObjects;

acumRegion = 0; % Acumular la cantidad de pixeles de las celulas enfermas
for i = 1:numRegs          
    acumRegion = acumRegion + length(connRegs.PixelIdxList{1,i});
end

%total pixeles de las celulas, se obtienen segun umbral
b = sum(imagen(:) > 190);

porcCelulasEnfermas = (acumRegion/b)*100; %Obtenemos porcentaje pixeles celulas enfermas

figure,subplot(1,2,1),colormap('gray'),imagesc(ImgOrinal);
        subplot(1,2,2),colormap('gray'),imagesc(imgRes);