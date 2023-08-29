function [z sol]=mycost(model,x)
    [~ ,tur]=sort(x);
    n=model.n;
    D=model.D;
    yol=0;
    for k=1:n
       i=tur(k);
       if k<n
           j=tur(k+1);
       else
           j=tur(1);
       end
       yol=yol+D(i,j);
  end
z=yol;
sol.tur=tur;
sol.L=yol;
end