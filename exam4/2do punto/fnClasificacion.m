function Clase = fnClasificacion(MangoAClasificar,EscalaMaduracionMangos)

%% Evalución de madurez del mango según la escala --------------------------------------------------------
R = MangoAClasificar(:,:,1);
G = MangoAClasificar(:,:,2);
B = MangoAClasificar(:,:,3);
pixelesMango = find(R > 0);
Mango = [mean(R(pixelesMango)),mean(G(pixelesMango)),mean(B(pixelesMango))];

Clase1 = "0% a 10%";
Clase2 = "10% a 30%";
Clase3 = "30% a 50%";
Clase4 = "50% a 70%";
Clase5 = "70% a 90%";
Clase6 = "90% a 100%";
[vClase]=[Clase1,Clase2,Clase3,Clase4,Clase5,Clase6];

    for i=1:6
        Diff=abs(EscalaMaduracionMangos(i,1)- Mango(1));
        if(i==1)
            Clase = vClase(1);
            Diffx = Diff;
        elseif(Diffx > Diff)
            Clase = vClase(i);
            Diffx = Diff;
        end
    end
end