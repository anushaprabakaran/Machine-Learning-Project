%Decision Tree classifier on the initial pre-processed data

%Load Data 
load('DataPreProcessed6.mat');

%Labels
%Training set
trainingSet = AdultDataTrainFinal6AgeEduOccRela(:,1:4);
%Separating the last label column from training set
trainingLabel = AdultDataTrainFinal6AgeEduOccRela(:,5:5);
%Test set
testSet = AdultDataTestFinal6AgeEduOccRela(:,1:4);
%Separating the last label column from test set
testLabel = AdultDataTestFinal6AgeEduOccRela(:,5:5);

%Decision Tree
tic;                      % start training time 
decisionTree = fitctree(trainingSet, trainingLabel);
toc;                      % end training time

%View the tree
view(decisionTree,'mode','graph'); 
 
%Predict the test labels
predictLabelTree = predict(decisionTree, testSet);

%Confusion Matrix of Tree
confusionMatrixTree = confusionmat(testLabel, predictLabelTree);
display(confusionMatrixTree);

%Plot Confusion Matrix of Tree
[n,p] = size(testSet);
isLabels = unique(testLabel);
nLabels = numel(isLabels);
[~,grpOutput] = ismember(predictLabelTree,isLabels); 
outputMat = zeros(nLabels,n); 
idxLinear = sub2ind([nLabels n],grpOutput,(1:n)'); 
outputMat(idxLinear) = 1;  
[~,grpLabel] = ismember(testLabel,isLabels); 
labelMat = zeros(nLabels,n); 
idxLinearY = sub2ind([nLabels n],grpLabel,(1:n)'); 
labelMat(idxLinearY) = 1;
plotconfusion(labelMat,outputMat);

%Accuracy of Tree
accuracyTree = sum(diag(confusionMatrixTree))/sum(confusionMatrixTree(:));  
fprintf('\n The accuracy for Decision Tree Model is %0.4f\n', accuracyTree);

%Resub
resuberrorTree = resubLoss(decisionTree);
fprintf('\n The resuberror for Decision Tree Model is %0.4f\n', resuberrorTree);

%Cross Validation
cvTree = crossval(decisionTree, 'KFold', 10);
cvLossTree = kfoldLoss(cvTree);
fprintf('\n The cvLoss for Decision Tree Model is %0.4f\n', cvLossTree);



