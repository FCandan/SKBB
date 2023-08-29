function model=createmodel(locX,locY)
    x=locX;
    y=locY;
    n=numel(x);
    D=zeros(n);
    for i=1:n-1
        for j=i:n
            D(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
            D(j,i)=D(i,j);
        end
    end
model.n=n;
model.x=x;
model.y=y;
model.D=D;
end