function [Mango] = fnExtraerMangoImagen(imagen)
    R = imagen(:,:,1);
    R(1:73,1:83)=255;

    G = imagen(:,:,2);
    G(1:73,1:83)=255;

    B = imagen(:,:,3);
    B(1:73,1:83)=255;
    B(B>250)=255;

pixelesMango = find(R < 250);
Mango = [mean(R(pixelesMango)),mean(G(pixelesMango)),mean(B(pixelesMango))];
end