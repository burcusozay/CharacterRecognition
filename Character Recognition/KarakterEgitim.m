function [net]=KarakterEgitim(yol)
path=strcat(yol,'\*.jpg');
kaynakdos=dir(path);
 boyut=length(kaynakdos);
Girdi=zeros(2500,boyut);

for i=1:length(kaynakdos)
    dosyaadi=strcat('C:\Users\hp\Desktop\Yeni Harfler\',kaynakdos(i).name);
    I=imread(dosyaadi);
    %I=im2bw(I);     
     I=imresize(I,[50,50]);    
     I=rgb2gray(I);
       I=edge(I,'sobel'); 
       I=double(I);      
      I=reshape(I,2500,1);
    % I=bwmorph(~I,'thin','inf');    
     Girdi(:,i)=I;     
end

%P=GirisMatrisCreation(A, B, C);
%Target=eye(3);
Sonuc=xlsread('hedefsonuc1.xlsx','Sayfa1');
net=newff(minmax(Girdi),[10 4], {'logsig','logsig'},'trainscg');
net.trainParam.perf='sse';
net.trainParam.epochs=500;
net.trainParam.goal=1e-5;
net=train(net,Girdi,Sonuc);
%ccc=neuralNetworkTrain(P,Target);
save YSA
end