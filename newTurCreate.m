function newx=newTurCreate(x,ccost,itn)    
[ ~,tur]=sort(x);
    n=numel(tur);
    
    %% yöntem_____________________________________________________
         randep=randi([1,n],1,2); 
    ep1=randep(1);
    ep2=randep(2);
    ep3=n-ep1-ep2;
    if ep1>ep2
        tur1=(tur(1:ep2));
        tur2=fliplr(tur(ep2+1:ep1));
        tur3=(tur(ep1+1:n));
        newtur=[(tur1) (tur2) (tur3)];
    elseif ep3>ep2
        tur1=(tur(1:ep1));
        tur2=fliplr(tur(ep1+1:ep2));
        tur3=(tur(ep2+1:n));
        n2=numel(tur3);
        tur3=randsample(tur3,n2);
        newtur=[(tur1) (tur2) tur3 ];
    else
        tur1=(tur(1:ep1));
        tur2=fliplr(tur(ep1+1:ep2));
        n2=numel(tur2);
        tur2=randsample(tur2,n2);
        tur3=fliplr(tur(ep2+1:n));
        newtur=[tur3 (tur1) (tur2) ];
    end
    
     %% yeni turCreate olmadan__________________________________________
%      newtur=tur; 
    %% yeni turCreate Random __________________________________________
%       newtur=randsample(tur,n); 
  %%
    newx=zeros(size(x));
    newx(newtur)=x(tur);
end