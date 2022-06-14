function [xmin,rmin]=regret(price,window,pmax,etot,S);

[S,nt]=size(price);
[na,nt]=size(window);

cost=[zeros(1,na*nt),1];

Lb=zeros(na*nt+1,1);

Ub=[];
for k=1:na;
Ub=[Ub;pmax(k)*window(k,:)'];
end;
Ub=[Ub;10^10];

Ae=[kron(eye(na),ones(1,nt)),zeros(na,1)];

be=etot;
Ain=[kron(ones(1,na),price),-ones(S,1)];

Bi=[];
for k=1:S;
    Ut=Utopia2(price(k,:),window,pmax,etot);
    Bi=[Bi;Ut];
end;

[xmin,rmin]=linprog(cost,Ain,Bi,Ae,be,Lb,Ub);