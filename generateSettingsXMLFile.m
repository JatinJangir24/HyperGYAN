% Use this file to generate the "settings.xml" for a classifier.
% Author: Jatin O. Jangir

% This is the name that will be displayed in the progeam
classifierName = 'SPTWSVM - Sparse Pinball Twin Support Vector Machine';

% This is the relative location of the main file which needs to be loaded.
fnName = 'Sparse_Pin_TSVM';

% This is the folder/node under which this classifier will appear.
baseClassifierType = 'TWSVM based Classifiers';

% This is the location where the settings.mat file will be saved. The
% filename MUST be "settings.xml"
saveLocation = ['./' classifierName '/settings.xml'];

% This is to enable additional configuration options.
configureClassifierButtonEnable = false;

configurationOptions = struct();

% These are the internal names of hyperperameters the classifiers has.
% i.e. names of the fields of the struct funpara.
% (the double curly brackets are required for the construction of the struct.
hyperParamNames = {{'c', 'epsilon', 'tau', 'kerfParaType', 'kerfParaPars'}};

% TODO: add options to get info about the Hyperparameters
% This is the number of hyperperameters the classifiers has.
numberOfHyperparameters = length(hyperParamNames{:});

% Making the settings Struct. Please do not edit the keywords.
settings = struct( ...
                    'classifierName', classifierName, ...
                    'fnName', fnName, ...
                    'configureClassifierButtonEnable', configureClassifierButtonEnable, ...
                    'configurationOptions',configurationOptions,...
                    'numberOfHyperparameters',numberOfHyperparameters,...
                    'hyperParamNames', hyperParamNames,...
                    'nodeType', 'classifier',...
                    'baseClassifierType', baseClassifierType...
                    )

% Saving settings.xml
writestruct(settings, saveLocation)