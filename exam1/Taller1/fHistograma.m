function vertorHistograma = fHistograma(imagenEntrada)
    % Esta función se obtiene el histograma de una imagen en escala de grises
    vertorHistograma = zeros(1, 256);

    for valorPixelTemporal = 0:255
        frec = find(imagenEntrada == valorPixelTemporal);
        vertorHistograma(1, valorPixelTemporal + 1) = length(frec);
    end
end