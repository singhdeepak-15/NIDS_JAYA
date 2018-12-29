function [trainedClassifier, validationAccuracy] = trainClassifier_35(datasetTable,dim)
% Convert input to table
datasetTable = table(datasetTable);
datasetTable.Properties.VariableNames = {'column'};
% Split matrices in the input table into vectors
datasetTable.column_1 = datasetTable.column(:,1);
datasetTable.column_2 = datasetTable.column(:,2);
datasetTable.column_3 = datasetTable.column(:,3);
datasetTable.column_4 = datasetTable.column(:,4);
datasetTable.column_5 = datasetTable.column(:,5);
datasetTable.column_6 = datasetTable.column(:,6);
datasetTable.column_7 = datasetTable.column(:,7);
datasetTable.column_8 = datasetTable.column(:,8);
datasetTable.column_9 = datasetTable.column(:,9);
datasetTable.column_10 = datasetTable.column(:,10);
datasetTable.column_11 = datasetTable.column(:,11);
datasetTable.column_12 = datasetTable.column(:,12);
datasetTable.column_13 = datasetTable.column(:,13);
datasetTable.column_14 = datasetTable.column(:,14);
datasetTable.column_15 = datasetTable.column(:,15);
datasetTable.column_16 = datasetTable.column(:,16);
datasetTable.column_17 = datasetTable.column(:,17);
datasetTable.column_18 = datasetTable.column(:,18);
datasetTable.column_19 = datasetTable.column(:,19);
datasetTable.column_20 = datasetTable.column(:,20);
datasetTable.column_21 = datasetTable.column(:,21);
datasetTable.column_22 = datasetTable.column(:,22);
datasetTable.column_23 = datasetTable.column(:,23);
datasetTable.column_24 = datasetTable.column(:,24);
datasetTable.column_25 = datasetTable.column(:,25);
datasetTable.column_26 = datasetTable.column(:,26);
datasetTable.column_27 = datasetTable.column(:,27);
datasetTable.column_28 = datasetTable.column(:,28);
datasetTable.column_29 = datasetTable.column(:,29);
datasetTable.column_30 = datasetTable.column(:,30);
datasetTable.column_31 = datasetTable.column(:,31);
datasetTable.column_32 = datasetTable.column(:,32);
datasetTable.column_33 = datasetTable.column(:,33);
datasetTable.column_34 = datasetTable.column(:,34);
datasetTable.column_35 = datasetTable.column(:,35);
datasetTable.column_36 = datasetTable.column(:,36);
datasetTable.column_37 = datasetTable.column(:,37);
datasetTable.column_38 = datasetTable.column(:,38);
datasetTable.column_39 = datasetTable.column(:,39);
datasetTable.column_40 = datasetTable.column(:,40);
datasetTable.column_41 = datasetTable.column(:,41);
datasetTable.column_42 = datasetTable.column(:,42);
datasetTable.column = [];
% Extract predictors and response
predictorNames = {'column_1', 'column_2', 'column_3', 'column_4', 'column_5', 'column_6', 'column_7', 'column_8', 'column_9', 'column_10', 'column_11', 'column_12', 'column_13', 'column_14', 'column_15', 'column_16', 'column_17', 'column_18', 'column_19', 'column_20', 'column_21', 'column_22', 'column_23', 'column_24', 'column_25', 'column_26', 'column_27', 'column_28', 'column_29', 'column_30', 'column_31', 'column_32', 'column_33', 'column_34', 'column_35', 'column_36', 'column_37', 'column_38', 'column_39', 'column_40', 'column_41'};
predictors = datasetTable(:,predictorNames);
predictors = table2array(varfun(@double, predictors));
response = datasetTable.column_42;
% Data transformation: Select subset of the features

predictors = predictors(:,1:dim);%[true true true true true true true true true true true true true true true true true true true true true true true true true true true true true true true true true true true false false false false false false]);
% Train a classifier
trainedClassifier = fitctree(predictors, response, 'PredictorNames', {'column_1' 'column_2' 'column_3' 'column_4' 'column_5' 'column_6' 'column_7' 'column_8' 'column_9' 'column_10' 'column_11' 'column_12' 'column_13' 'column_14' 'column_15' 'column_16' 'column_17' 'column_18' 'column_19' 'column_20' 'column_21' 'column_22' 'column_23' 'column_24' 'column_25' 'column_26' 'column_27' 'column_28' 'column_29' 'column_30' 'column_31' 'column_32' 'column_33' 'column_34' 'column_35'}, 'ResponseName', 'column_42', 'ClassNames', [1 2 3 4 5], 'SplitCriterion', 'gdi', 'MaxNumSplits', 100, 'Surrogate', 'off');

% Perform cross-validation
partitionedModel = crossval(trainedClassifier, 'KFold', 5);

% Compute validation accuracy
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');

%% Uncomment this section to compute validation predictions and scores:
% % Compute validation predictions and scores
% [validationPredictions, validationScores] = kfoldPredict(partitionedModel);