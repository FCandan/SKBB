function gbest=PSO(maxIter,nPOP,c1,c2,show,rpeat,locX,locY)
 
%% Problem tanýmý
model=createmodel(locX,locY);
costfuntion=@(x) mycost(model,x);
nVar=model.n;
varMin=0;
varMax=50;
varSize=[1 nVar];
nStation=numel(locX);
show=show;
%% PSO parametreleri
% Pso parametleri burda tanýmlanýr
%   maxIter     itererasyon sýyýsý
%   nPOP        Populasyondaki parçacýk sayýsý
%   c1    Biliþse komponent bu deðer 
%   c2    Biliþsel komponent
%   w   aðýrlýk
%pso_params=PSO(maxIter,nPOP,c1,c2,show,rpeat,locX,locY)
maxIter=100;
nPOP=50;
c1=2;c2=2;
w=1;
wdamp=0.9;

%% initilization
parcacik.poz=[];
parcacik.cost=[];
parcacik.sol=[];
parcacik.velocity=[];
parcacik.pbest.poz=[];
parcacik.pbest.cost=[];
parcacik.pbest.sol=[];

suru=repmat(parcacik,nPOP,1);
gbest.cost=inf;
gbest.poz=inf;
gbestcost=zeros(maxIter,1);
for i=1:nPOP
   suru(i).poz=randi([varMin varMax],varSize);
   [suru(i).cost suru(i).sol]=costfuntion(suru(i).poz);
   suru(i).pbest.poz=suru(i).poz;
   suru(i).pbest.cost=suru(i).cost;
   suru(i).pbest.sol=suru(i).sol;
   suru(i).velocity=0;
   
   if suru(i).pbest.cost<gbest.cost
        gbest.cost=suru(i).pbest.cost;
        gbest.poz=suru(i).pbest.poz;
        gbest.sol=suru(i).pbest.sol;
   end
   
end

%%
for it=1:maxIter
    % update velocity
  for i=1:nPOP
      suru(i).velocity=w*suru(i).velocity+...
          c1*rand*(suru(i).pbest.poz-suru(i).poz)+...
          c2*rand*(gbest.poz-suru(i).poz);
% update durum
    suru(i).poz=suru(i).poz+suru(i).velocity;
    [suru(i).cost suru(i).sol]=costfuntion(suru(i).poz);
% newTurCreate
      newsol.poz=newTurCreate(suru(i).poz,suru(i).cost,it); 
      [newsol.cost newsol.sol]=costfuntion(newsol.poz); 
      
      if newsol.cost<suru(i).cost
         suru(i).poz=newsol.poz;
         suru(i).cost=newsol.cost;
         suru(i).sol=newsol.sol;
      end
% update pbest cost and pozisition
        if suru(i).cost<suru(i).pbest.cost
            suru(i).pbest.cost=suru(i).cost;
            suru(i).pbest.poz=suru(i).poz;
            suru(i).pbest.sol=suru(i).sol;
        end
        if suru(i).pbest.cost<gbest.cost
            gbest.cost=suru(i).pbest.cost;
            gbest.poz=suru(i).pbest.poz;
            gbest.sol=suru(i).pbest.sol;
        end
  end
    if newsol.cost<gbest.cost
         gbest.poz=newsol;
    end
      gbestcost(it)=gbest.cost;
    w=w*wdamp;
    if show==true
        figure(1);
        plotyol(gbest.sol.tur,model);
       
    end
 end

        %% Visualition
    if show==true
        figure(2);
        plot(gbestcost);
        xlabel(' ITERASYON');
        ylabel('En ÝYÝ ÇÖZÜM (GBEST)');
         saveas(figure(1),['yollarimg/' num2str(gbest.cost) 'gbest-' num2str(rpeat) '1.jpg']);
         saveas(figure(2),['yollarimg/' num2str(gbest.cost) 'gbest-' num2str(rpeat) '2.jpg']);
    end
 end