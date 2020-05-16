function sizes = fnConnRegCount(inputIm)
    
      connRegs = bwconncomp(inputIm);
    
       numRegs = connRegs.NumObjects;
      
         sizes = zeros(numRegs,1);

         for i = 1:numRegs          
    sizes(i,1) = length(connRegs.PixelIdxList{1,i});             
         end
    
    
end