function [Y1,train_tym] = ShallowNeuralNetwork(TestX,DataTrain2,FunPara)
    %% Training Set
    trainX = DataTrain2(:, 1:end-1);
    trainY = DataTrain2(:, end);
    %% Testing Set
    testX = TestX(:, 1:end-1);
    
    numFeatures = size(trainX, 2);
    numClasses = 2;
    
    layers = [
        featureInputLayer(numFeatures, 'Normalization', 'zscore')
        fullyConnectedLayer(FunPara.fullyConnectedLayerSize)
        batchNormalizationLayer
        reluLayer
        fullyConnectedLayer(numClasses)
        softmaxLayer
        classificationLayer];
    
    miniBatchSize = FunPara.miniBatchSize;
    
    options = trainingOptions('adam', ...
        'MiniBatchSize', miniBatchSize, ...
        'Shuffle', 'every-epoch', ...
        'Plots', 'none', ...
        'Verbose', false);
    
    tic
    net = trainNetwork(trainX, categorical(trainY), layers, options);
    train_tym = toc;
    % delete(findall(0));
    Y1 = classify(net, testX, 'MiniBatchSize', miniBatchSize);
    Y1 = double(Y1);
end




