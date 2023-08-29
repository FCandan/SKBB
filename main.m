clear;close all;clc;
% you can chosee any location for testing but it must be pair locX-locY
%exact location
 locX=[10 10 10 10 10 40 40 40 40 40 70 70 70 70 70 100 100 100 100 100 130 130 130 130 130 ];
 locY=[10 40 70 100 130 10 40 70 100 130 10 40 70 100 130 10 40 70 100 130 10 40 70 100 130 ];
 % large location
% locX=[88,138,2,79,139,106,49,104,134,29,107,19,137,22,30,52,86,5,5,63,8,1,63,112,122,11,35,81,36,67,32,144,37,128,20,17,105,81,47,60,42,78,125,80,75,34,99,110,24,73];
% locY=[43,95,31,116,36,49,110,39,5,126,146,97,47,129,32,60,116,5,6,89,61,38,134,117,35,106,12,39,131,73,67,3,110,63,96,50,9,76,59,106,85,147,146,88,117,118,139,150,40,111];
% other chose 
% locX=[80,30,140,90,12,118,101,12,117,75,79,133,57,20,61,40,54,67,120,107,123,42,41,18,141];
% locY=[59,20,120,100,24,67,136,84,141,148,31,52,105,109,82,130,15,26,20,92,88,75,38,64,27];
%big location
% locX=[37 49	52	20	40	21	17	31	52	51	42	31	5	12	36	52	27	17	13	57	62	42	16	8	7	27	30	43	58	58	37	38	46	61	62	63	32	45	59	5	10	21	5	30	39	32	25	25	48	56	30];
% locY=[52 49	64	26	30	47	63	62	33	21	41	32	25	42	16	41	23	33	13	58	42	57	57	52	38	68	48	67	48	27	69	46	10	33	63	69	22	35	15	6	17	10	64	15	10	39	32	55	28	37	40];
it2=30;
nStation=numel(locX);
gbestSonuc=zeros(it2,1);
gbesttur=zeros(it2,nStation);
for i=1:it2
    c1=2;
    c2=2;
  xx=PSO(400,50,c1,c2,1,i,locX,locY);
 gbestSonuc(i)=xx.cost;
 gbesttur(i,:)=xx.sol.tur;
 disp([num2str(i) '-: ' num2str(xx.sol.tur) ' GBEST : ' num2str(gbestSonuc(i))]);
   
end
disp(['Ortama: ' num2str(mean(gbestSonuc)) ' MIN= ' num2str(min(gbestSonuc)) ' MAX= ' num2str(max(gbestSonuc))]);
 disp([num2str(sort(unique(gbestSonuc)))]);
% c=nchoosek(sort(unique(gbestSonuc)));
% dlmwrite('gbestSonuc.txt', c);