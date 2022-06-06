% Author: Jatin O. Jangir
function [Predict_Y,train_time] = C_SVM(TestX,DataTrain2,FunPara)
    if strcmp(FunPara.kerfParaType, 'lin')
        kern_type = 0;
    elseif strcmp(FunPara.kerfParaType, 'poly')
        kern_type = 1;
    elseif strcmp(FunPara.kerfParaType, 'rbf')
        kern_type = 2;
    elseif strcmp(FunPara.kerfParaType, 'sigmoid')
        kern_type = 3;
    end
    
    tic;
    SVMModel = svmtrain1(DataTrain2(:,end),DataTrain2(:,1:end-1), ['-q -s 0 -t ' num2str(kern_type) ' -c ' num2str(FunPara.c) ' -g ' num2str(FunPara.kerfParaPars)]);
    train_time=toc;
    
    [Predict_Y,~,~] = svmpredict1(TestX(:,end),TestX(:,1:end-1), SVMModel, '-q');
    
end