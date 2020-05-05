
function fnPunto2_Taller2
%% Punto 2 del Talle 2
%{
Implemente una función en Matlab para umbralizar la respuesta de una imagen a un filtrado pasa-altos.
La umbalización debe basarse en la normalización propuesta en el problema 1. La función debe recibir
tres argumentos de entrada:
1. Una imagen en escala de grises.
2. El tipo de filtro pasa-altos: Sobel, Prewitt, Laplaciano, o Laplaciano de la Gaussiana.
3. Un valor entre 0 y 0.9, para umbralizar la imagen con las respuestas al filtrado pasa-altos.
El resultado de esta función debe ser una imagen binaria.
%}

%% Inicio ---------------------------------------------------------------------------------
clc
close all
clear

%% Cargar imagen ------------------------------------------------------------------------
uiwait(msgbox ('Selecciona una imagen'));
cuentaSeleccion=0;
while (cuentaSeleccion<=2)
CarpetaImagenes = fullfile('C:\',''); 
[archivoImagen,SeleccionUsuario]= imgetfile('InitialPath',CarpetaImagenes);
    if SeleccionUsuario==true
        cuentaSeleccion=cuentaSeleccion+1;
        if cuentaSeleccion==2
            uiwait(msgbox('Es obligatorio seleccionar una imagen,la función finalizará'));
            return
        end
    else
        uiwait(msgbox('Imagen cargada'));
        break
    end
end

%% Seleccionar tipo filtro pasa altos ------------------------------------------------------
uiwait(msgbox ('Seleccion un tipo de filtro PasaAltos'));
cuentaSeleccion=0;
while (cuentaSeleccion<=2)
listaPasaAltos={'Sobel', 'Prewitt', 'Laplaciano','Laplaciano de la Gaussiana'};
[PasaAltos,SeleccionUsuario]= listdlg('PromptString',{'Seleccione un PasaAltos','.'},...
                                        'SelectionMode','single','ListString',listaPasaAltos);
    if SeleccionUsuario==false
        cuentaSeleccion=cuentaSeleccion+1;
        if cuentaSeleccion==2
            uiwait(msgbox('Es obligatorio seleccionar un PasaAltos, la función finalizará'));
            return
        end
    else
        uiwait(msgbox('PasaAltos seleccionado'));
        break
    end
end

%% Ingresar Umbral -------------------------------------------------------------------------
%uiwait(msgbox ('Ingrese un umbral'));
umbral=inputdlg ('Ingrese un umbral');
NroUmbral=str2double(umbral);
cuentaSeleccion=0;
while (cuentaSeleccion<=2)
    if isempty(NroUmbral)
        cuentaSeleccion=cuentaSeleccion+1;
        if cuentaSeleccion==2
            uiwait(msgbox('Es obligatorio indicar un Umbral, la función finalizará'));
            return
        end
    elseif NroUmbral>=0 && NroUmbral<=0.9
        uiwait(msgbox('Umbral ingresado correctamente'));
        break
    else
        uiwait(msgbox('El umbral debe estar entre 0 y 0.9, la función finalizará'));
        return
    end
end

%% Tratamos la imagen ---------------------------------------------------------------------
imagen=imread(archivoImagen); % Leemos imagen
imagenGris = rgb2gray(imagen); % Convertimos a escala de grises.
imagenFiltrada=fnPasaAltos(imagenGris,PasaAltos); % Filtramos
imagenNormalizada=rescale(imagenFiltrada); % Normalizamos
imagenNormalizada=round(imagenNormalizada,1);
% Umbralizamos
imagenUmbralizada=imagenNormalizada;
imagenUmbralizada(imagenNormalizada<=NroUmbral)=0;
imagenUmbralizada(imagenNormalizada>NroUmbral)=1;

%% Grafiquemos -----------------------------------------------------------------------------
 figure,subplot(2,2,1),imshow(imagen); title('Imagen Original');
        subplot(2,2,2),imshow(imagenGris);title('Imagen escala de grises');
        subplot(2,2,3),imshow(imagenFiltrada); title('Imagen Filtrada');
        subplot(2,2,4),imshow(imagenUmbralizada);title('Imagen Umbralizada');
end  