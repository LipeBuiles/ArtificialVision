function vectorHistograma = fnHistograma(imagen)
    %Forma general - encabezado de una funci�n
    %function [salida1, salida2] = nombreFuncion(entrada)
    %Esta funci�n devuelve el histograma de na imagen en escala de grises

    %Son 256 porque son 255 los pixeles a recorrer
    vectorHistograma = zeros(1,256);
    
    %Recorremos la imagen y nos devuelve la ubicaci�n del pixel donde
    %encuentre un pixel igual a cero, y asi sucesivamente hasta llegar a
    %255
    for valorPixelTemporal = 0:255
        %Devuelve la posici�n en la que se encuentra el pixel buscado
        frec = find(imagen == valorPixelTemporal);
        vectorHistograma(1,valorPixelTemporal + 1) = length(frec);
    end

end