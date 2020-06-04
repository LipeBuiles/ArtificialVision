
%% Inicio ---------------------------------------------------------------------------------
clc
close all
clear
%% Cargamos imagen ------------------------------------------------------------------------
imagen = imread('EscalaMangos.png');

%% Tratamiento de imagen para separar las imagenes ----------------------------------------
ImagenMad1 = imagen(113:476,89:357,:); %0 a 10% Maduraci�n
ImagenMad2 = imagen(113:476,383:651,:); %10 a 30% Maduraci�n
ImagenMad3 = imagen(113:476,677:945,:); %30 a 50% Maduraci�n
ImagenMad4 = imagen(113:476,975:1240,:); %50 a 70% Maduraci�n
ImagenMad5 = imagen(113:476,1266:1534,:);%70 a 90% Maduraci�n
ImagenMad6 = imagen(113:476,1560:1828,:); %90 a 100% Maduraci�n

%% Tratamiento de imagenes para extraer la escala de maduraci�n de los mangos -------------
[Mango1] = fnExtraerMangoImagen(ImagenMad1);
[Mango2] = fnExtraerMangoImagen(ImagenMad2);
[Mango3] = fnExtraerMangoImagen(ImagenMad3);
[Mango4] = fnExtraerMangoImagen(ImagenMad4);
[Mango5] = fnExtraerMangoImagen(ImagenMad5);
[Mango6] = fnExtraerMangoImagen(ImagenMad6);

EscalaMaduracionMangos = [Mango1;Mango2;Mango3;Mango4;Mango5;Mango6];

%% Cargamos imagenes a clasificar --------------------------------------------------------
ImagenAClasificar = imread('MangosAClasificar.jpg');
MangosAClasificar = ImagenAClasificar(129:819,219:1228,:); % Recortar Imagen
[sx, sy, sz] = size(MangosAClasificar); % Componentes dimensionales de la imagen
SeleccionMangos = MangosAClasificar(1:round(sx/2),:,:); % Parte superior de la imagen
sy_escalar = round(sy/5); %Obtenci�n de escalar comun en la coordenada y
imshow(SeleccionMangos); title('Mangos a clasificar seg�n su maduraci�n');
figure;

%% Proceso de clasificaci�n --------------------------------------------------------
for i=1:5
    if(i==1)
        img = SeleccionMangos(:,i:i*sy_escalar-1,:);
    else
        img = SeleccionMangos(:,(i-1)*sy_escalar:i*sy_escalar-1,:);
    end
    clase = fnClasificacion(img,EscalaMaduracionMangos);
    subplot(1,5,i),imshow(img),title(strcat('Maduraci�n de',clase));
end
  




