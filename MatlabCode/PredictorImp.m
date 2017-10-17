%Predictor Importance : Significant features

load('PredictorImpData.mat');

%Ten Features
trainData = trainDataOriginal(:,{'age','workClass', 'education_num', 'marital_status', 'occupation', 'relationship', 'race', 'sex','hours_per_week', 'native_country', 'salary'});

%Decision Tree Model
decisionTreePredictorImp = fitctree(trainData,'salary','PredictorSelection','curvature','Surrogate','on');

% Predict the importance
importance = predictorImportance(decisionTreePredictorImp);

%Bar chart
figure;
bar(importance);
title('Predictor Importance Estimates');
ylabel('Estimates');
xlabel('Predictors');
h = gca;
h.XTickLabel = decisionTreePredictorImp.PredictorNames;
h.XTickLabelRotation = 45;
h.TickLabelInterpreter = 'none';
