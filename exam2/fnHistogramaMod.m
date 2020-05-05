function vectorHistograma = fnHistogramaMod(imagen)
    vectorHistograma = zeros(1,10);
    for valorPixelTemporal = 0:9
        %Devuelve la posición en la que se encuentra el pixel buscado
        frec = find(imagen == valorPixelTemporal/10);
        vectorHistograma(1,valorPixelTemporal + 1) = length(frec);
    end

end