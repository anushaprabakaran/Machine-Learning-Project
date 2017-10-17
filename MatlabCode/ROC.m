%ROC for 10 features : Pre-processed data

load('ROCData.mat');

%Labels
trainingSet = trainsetroc(:,1:10);
testSet = testsetroc(:,1:10);

respTrain = strcmp(trainbglabel,'b');
respTest = strcmp(testbglabel,'b');

%Decision Tree
decisionTree = fitctree(trainingSet, respTrain);
[~,score_tree] = resubPredict(decisionTree);
[Xtree,Ytree,Ttree,AUCtree] = perfcurve(respTrain,score_tree(:,decisionTree.ClassNames),'true');
plot(Xtree,Ytree);

%k-Nearest Neighbor
kNearestNeighbor = fitcknn(trainingSet, respTrain);
[~,score_knn] = resubPredict(kNearestNeighbor);
[Xknn,Yknn,Tknn,AUCknn] = perfcurve(respTrain,score_knn(:,kNearestNeighbor.ClassNames),'true');

%Naive Bayes
naiveBayes = fitcnb(trainingSet, respTrain);
[~,score_nb] = resubPredict(naiveBayes);
[Xnb,Ynb,Tnb,AUCnb] = perfcurve(respTrain,score_nb(:,naiveBayes.ClassNames),'true');
plot(Xnb,Ynb);

%Plotting the ROC 
plot(Xtree,Ytree)
hold on
plot(Xknn,Yknn)
plot(Xnb,Ynb)
legend('Decision Tree','k-Nearest Neighbor','Naive Bayes','Location','Best')
xlabel('False positive rate');
ylabel('True positive rate');
title('ROC Curves for DecisionTree, kNN, and Naive Bayes Classification')
hold off
