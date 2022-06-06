function [Y1,train_time] = HRaF(TestX,DataTrain2,FunPara)
% FunPara.ntrees
FunPara.nvartosample = round(sqrt(size(DataTrain2(:,1:end-1),2)));

tic
model = ObliqueRF_train(DataTrain2(:,1:end-1),DataTrain2(:,end),FunPara);
train_time=toc;

Y1 = ObliqueRF_predict(TestX(:,1:end-1),model);

% acc = length(find(Y1==testY))/size(testY,1);

end




