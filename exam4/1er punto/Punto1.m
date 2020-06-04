%% Inicio ---------------------------------------------------------------------------------
clc
close all 
clear

%% Cargamos la imagen e imprimimos la imagen inicial --------------------------------------
imagen = imread('LCC.jpeg');
imagen = imagen(1:997,1:1280,:);
figure,imshow(imagen),title('Imagen Original');

%% Separamos las componentes de la imagen  RGB --------------------------------------------
R = imagen(:,:,1);
G = imagen(:,:,2);
B = imagen(:,:,3);  
 
%% Separamos las componentes de la imagen HSV ---------------------------------------------
imagenHSV = rgb2hsv(imagen);
H = imagenHSV(:,:,1);
S = imagenHSV(:,:,2);
V = imagenHSV(:,:,3); 
 
%% Umbralizamos la componente G, S y binarizamos ------------------------------------------
uR = graythresh(G);
Gbin = imbinarize(G,uR);
Gbin = double(~Gbin);
uS = graythresh(S);
Sbin = imbinarize(S,uS);

%% Eliminizamos el ruido de la imagen ----------------------------------------------------
Def = xor(Gbin,Sbin);
Def = double(bwareaopen(Def,100));
GbinP = double(bwareaopen(Gbin,500));
GbinP(GbinP == 1) = 2;

%% Detección de las celulas enfermas -----------------------------------------------------
detenciones = GbinP + Def;
figure,colormap('winter'),imagesc(detenciones),title('Imagen Celulas Enfermas');
 
%% Sectorizamos la imagen y calculamos el promedio del área de las celulas enfermas ------
cc = bwconncomp(detenciones);
NroRegiones = cc.NumObjects;
stats = regionprops('table' , cc,'Area');
promedio = mean(stats.Area)

fusionDef = imfuse(imagen,detenciones,'blend');
figure,imshow(fusionDef);title('Imagen final');
