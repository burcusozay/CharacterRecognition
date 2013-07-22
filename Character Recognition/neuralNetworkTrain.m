function [net]=neuralNetworkTrain(Giris,Target)
net=newff(minmax(Giris),[120 4], {'logsig','logsig'},'trainscg');
net.trainParam.perf='sse';
net.trainParam.epochs=500;
net.trainParam.goal=1e-5;
net=train(net,Giris,Target);
end