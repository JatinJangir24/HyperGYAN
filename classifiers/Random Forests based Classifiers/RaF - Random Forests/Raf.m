function [Predict_Y,train_time] = Raf(TestX,DataTrain2,FunPara)
    nTree=FunPara.nTree;
    mtry=round(sqrt(size(DataTrain2(:,1:end-1),2)));
    
    [model1, train_time]=ObliqueRF_train(DataTrain2(:,1:end-1),DataTrain2(:,end),'ntrees',nTree,'nvartosample',mtry,'oblique',1);
    [Predict_Y, ~]=ObliqueRF_predict(TestX(:,1:end-1),model1);
end