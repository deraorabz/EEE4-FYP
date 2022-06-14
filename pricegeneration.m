function prices=pricegeneration(UB,LB)

n = max(size(UB));

if n==1
    prices = [UB;LB];
else
    prices = [UB(1)*ones(2^(n-1),1),pricegeneration(UB(2:n),LB(2:n)); LB(1)*ones(2^(n-1),1),pricegeneration(UB(2:n),LB(2:n))]; 
end 