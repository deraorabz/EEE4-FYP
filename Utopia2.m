function cost=Utopia2(price,windows,pmaxvector,etotvector)


tempcost=0;
for k=1:max(size(pmaxvector))
    [x,y]=Utopia(price,windows(k,:),pmaxvector(k),etotvector(k));
    tempcost=tempcost+y;
end;

cost=tempcost;