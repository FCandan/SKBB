function plotyol(tur,model)
    x=model.x;
    y=model.y;
    tur=[tur tur(1)];
    labels=string(1:numel(y));
    plot(x(tur),y(tur),'r-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','r');
     text(x,y,labels,'VerticalAlignment','cap','HorizontalAlignment','left')
    axis([0 160 0 160])
    grid on
grid minor
set(gca,'xtick',[0:10:160])
set(gca,'ytick',[0:10:160])
end