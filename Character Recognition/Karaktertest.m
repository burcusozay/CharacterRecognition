function [c,cm,ind,per]=Karaktertest(testyol)
load ('YSA');
path=strcat(testyol,'\*.jpg');
kaynakdos=dir(path);
%kaynakdos=dir('C:\Users\hp\Desktop\Yeni Harfler\Test\*.jpg');
 boyut=length(kaynakdos);
 Giris=zeros(2500,boyut);
 for i=1:length(kaynakdos)
    dosyaadi=strcat('C:\Users\hp\Desktop\Yeni Harfler\Test\',kaynakdos(i).name);
    I=imread(dosyaadi);   
    I=imresize(I,[50,50]);   
   I=rgb2gray(I);
   I=edge(I,'sobel');
    I=double(I);
     I=reshape(I,2500,1);
     Giris(:,i)=I;     
 end
tahmin=sim(net,Giris);
hedefsonuc=xlsread('testsonuc.xlsx','hsonuc');
[c,cm,ind,per]=confusion(hedefsonuc,tahmin);
%[X,Y]=perfcurve(hedefsonuc,tahmin,4);
figure;
plotroc(hedefsonuc,tahmin)

end