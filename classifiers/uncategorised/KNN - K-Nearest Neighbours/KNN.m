function [Y1,train_tym] = KNN(TestX,DataTrain2,FunPara)
    %% Training Set
    trainX = DataTrain2(:, 1:end-1);
    trainY = DataTrain2(:, end);
    %% Testing Set
    testX = TestX(:, 1:end-1);
    
    tic;
    Mdl = fitcknn(trainX,trainY,'NumNeighbors',FunPara.numNeighbors,'Standardize',1);
    train_tym = toc;
    [Y1] = predict(Mdl,testX);
end




