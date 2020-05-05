function imagenFiltrada=fnPasaAltos(imagen,tipofiltro)

% Operador del gradiente según el tipo de filtro
switch tipofiltro
    case 1 %'Sobel'
        GXFiltro = [-1 0 1; -2 0 2; -1 0 1];
        GYFiltro = [-1 -2 -1; 0 0 0; 1 2 1];
    case 2 %'Prewitt'
        GXFiltro = [-1 0 1; -1 0 1; -1 0 1];
        GYFiltro = [-1 -1 -1; 0 0 0; 1 1 1];
    case 3 %'Laplaciano'
        GXFiltro = [0 1 0; 1 -4 1; 0 1 0];
        GYFiltro = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    case 4 %'Laplaciano de la Gaussiana'
        GXFiltro = [0 -2 0; -2 8 -2; 0 -2 0]; 
        GYFiltro = [1 -2 1; -2 4 -2; 1 -2 1];
end   
   
%Gx=conv2(imagen, GXFiltro,'Same');
Gy=conv2(imagen, GYFiltro,'Same');
imagenFiltrada = Gy; %sqrt((Gx.^2) + (Gy.^2));
        
end