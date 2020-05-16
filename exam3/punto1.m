clc
close all
clear

%% Proceso la primer imagen
imagen = imread('img1.png');
imagen = ~double(imbinarize(imagen)); %Binarizamos la imagen y volvemos nuestra parte de inter�s blanca
imagen = bwlabel(imagen); %Etiquetamos las regiones de la imagen
imagen(imagen ~= 3) = 0; %Dejamos solo la parte que nos interesa
imagen1 = imagen; %Para mostrarla al final

imagen = bwmorph(imagen,'skel','Inf'); % Obtenemos el esqueleto morfologico

%obtenemos el n�mero de branchpoints
bp = bwmorph(imagen,'branchpoints');
nbp = length(find(bp == 1));

%obtenemos el n�mero de endpoints
ep = bwmorph(imagen,'endpoints');
nep = length(find(ep == 1));

vectorReferencia = [nbp, nep]; %Guardamos el vector de caracter�sticas de la regi�n de referencia

%% Inicio tratamieno de la segunda imagen
imagen2 = imread('img2.png');
imagen2 = ~double(imbinarize(imagen2)); %Binarizamos la imagen y volvemos nuestra parte de inter�s blanca

[labels,n] = bwlabel(imagen2); %Separamos por regiones las partes a analizar de la segunda imagen

sizes = zeros(n,2); %Creamos una matriz, para guardar el indice de las regiones analizadas 
                    % con su distancia euclidiana

% Recorremos las regiones de la segunda imagen
for i = 1:n    
    
    temp = labels; %paso la informaci�n de una regi�n a una variable temporal
    temp(labels ~= i) = 0; %solo dejo una regi�n para analizar
    
    temp = bwmorph(temp,'skel','Inf'); % Obtenemos el esqueleto morfologico
    
    bp1 = bwmorph(temp,'branchpoints'); %obtenemos el n�mero de branchpoints
    nbp1 = length(find(bp1 == 1));
    
    ep1 = bwmorph(temp,'endpoints'); %obtenemos el n�mero de endpoints
    nep1 = length(find(ep1 == 1));
    
    vectorTemp = [nbp1 nep1]; %Pasamos la informaci�n a un vector de caracter�sticas    
    result = pdist2(vectorReferencia, vectorTemp); % Obtenemos la distancia euclidiana

    % Guardamos el index de la regi�n analizada con la distancia euclidiana
    sizes(i,1) = i;
    sizes(i,2) = result; 
end

% Obtenemos el index con la menor distancia euclidiana
minIndex = 99;
minVector = 99;
for a = 1:n
    if sizes(a,2) > 0
        if sizes(a,2) < minVector
            minIndex = sizes(a,1);
            minVector = sizes(a,2);
        end
    end
end

% Solo dejamos el �rea que queriamos encontrar
labels(labels ~= minIndex) = 0;

% Mostramos el resultado
figure,subplot(1,2,1),colormap('gray'),imagesc(imagen1);
        subplot(1,2,2),colormap('gray'),imagesc(labels);

