function [x,cost]=Utopia(price,window,pmax,etot)

[x,cost]=linprog(price,[],[],ones(size(price)),etot,zeros(size(price)),pmax*window);