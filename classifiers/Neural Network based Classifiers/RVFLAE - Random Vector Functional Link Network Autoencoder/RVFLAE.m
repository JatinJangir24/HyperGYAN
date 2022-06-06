function [Predict_Y,train_time] = RVFLAE(TestX,DataTrain2,FunPara)
    trainX = DataTrain2(:, 1:end-1);
    trainY = DataTrain2(:, end);
    
    testX = TestX(:, 1:end-1);
    testY = TestX(:, end);
    
    tic
    [mdl, ~] = RVFLAE_train(trainX, trainY, FunPara);
    train_time = toc;
    
    [Predict_Y, ~] = RVFLAE_predict(testX, testY, mdl);
end