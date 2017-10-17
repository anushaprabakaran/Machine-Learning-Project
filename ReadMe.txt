TOPIC: Census Income Dataset to predict whether an individual will earn lesser or greater than fifty thousand dollars per year. 

Data set itself has seperate training and test data. I have used both Python and Matlab for my project. The indexing of string categories were done using python and the training was done using matlab.

(I have done all the three model classifiers seperately so it is easy to refer back to the screen shot. Though lot of steps, it was easy for me to refer back and change if needed easily. Moreover matlab was causing trouble by hanging inbetween on having the whole code in one .m file with different figure numbers. So I preferred it to be in seperate chunks. I also made .jpg of all .fig)

FOLDERS: 
	OriginalData: .txt and .xls of the original raw data downloaded from the UCI. (Step 1 - 2)

	ProcessedData: Excel sheets of all pre-processed data (These were imported into matlab)  (Step3 - 19)

	MatlabCode: Code (all modelNamePP#.m files) and workspace of both data import (DataPreProcessed#.mat - load()) and the final results for each of the three models (modelNamePP#.mat files). Predictor Importance and ROC curve. (Step 5 - 19)
	
	MatlabFigures:.fig files of confusion matrix of all three models, tree, predictor importance char and ROC curves. (Step 5 - 19)
	
	Python: Code used to index the string categories in the data initially and for grouping some categories within the feature.(Step 3 and 17)
	
	Snapshots: Screen shots of all matlab work code with results ( xxxCodeCM.jpg, xxxCodeChart.jpg, xxxCodeCurve.jpg ) and the .jpg of confusion matrix of all three models, tree, predictor importance chart and ROC curves (MatlabFigures have them in .fig). (Step 5 - 19)
 
Below are the STEPS showing the download of data, pre-processing and 3 training models (Decision Tree, k-Nearest Neighbor, Naive Bayes) on different set of pre-processed data (with different features). The files mentioned in the steps are in the above mentioned forlders.


Step1:
	Download data from: https://archive.ics.uci.edu/ml/datasets/Adult
		Data Folder:- https://archive.ics.uci.edu/ml/machine-learning-databases/adult/
		Two text files:- adult.data and adult.test(Raw data from the above link)


Step2:
	Text: AdultDataTrain.txt, AdultDataTest.txt
	Change to excel original(raw) data (Converted the text to excel by importing): AdultDataTrain_Original.xlxs, AdultDataTest_Original.xlxs


Step3:
	Pyhton Code for indexing the string categories to numbers(zero based): CodeTrainDataClean.py, CodeTestDataClean.py
	Text File (It gives the changes in txt file): AdultDataTrain_Clean.txt, AdultDataTest_Clean.txt
	Change to excel (Converted the text to excel by importing): AdultDataTrain_Clean.xlxs, AdultDataTest_Clean.xlxs


Step4:
	Pre-processing: Missing values and Feature Reduction
	Missing Values:
		WorkClass: Missing rows are deleted
		Occupation: Missing rows are deleted
		Native Contry : Fill the missing with United-states which has the index 0
	Feature Reduction: 
		Detele the columns C: Final Weight, D: Education, K: Capital Gain, L:Capital loss
	Excel: AdultDataTrain_Final.xlxs, AdultDataTest_Final.xlxs


MATLAB:- ( Run the classifier .m files loading the Imported excel in Matlab ( .mat) files )
Step5: 
Data Processing: Features- Age, Education_number, MaritalStatus, Occupation, Relationship, Race, Gender, HoursPerWeek and Native Country
	Excel: (import into matlab) AdultDataTrain_Final.xlxs, AdultDataTest_Final.xlxs
        Imported above excel in Matlab : DataPreProcessed1.mat
	Traning Models:-
		Descision Tree: DecisionTreePP1.m
			Workspace with results after running .m: DecisionTreePP1.mat
			ConfusinMatrix: DtreePP1CM.fig
			View tree: DtreePP1Tree.fig
			SnapShots: DTreePP1CodeCM.jpg, DtreePP1CM.jpg, DTreePP1Tree.jpg
		k-Nearest Neighbor: kNearestNeighborPP1.m
			Workspace with results after running .m : kNearestNeighborPP1.mat
			ConfusinMatrix: kNNPP1CM.fig
			SnapShots: kNNPP1CodeCM.jpg, knnPP1CM.jpg
		Naive-Bayes: NaiveBayesPP1.m
			Workspace with results after running .m : NaiveBayesPP1.mat
			ConfusinMatrix: NaiveBayesPP1CM.jpg
			SnapShots: NaiveBayesPP1CodeCM.jpg, NaiveBayesPP1CM.jpg


Step6:
Performing ROC for dataset. ROC needs labels in 'b' and 'g'. So have changed <=50 as 'b' and >50 as 'g'.
	Excel: (import into matlab) AdultDataTrain_Final.xlxs, AdultDataTest_Final.xlxs, trainbglabelROC2.xlxs, testbglabelROC2.xlxs
        Imported above excel in Matlab : ROCData2.mat
	ROC: ROC.m
	Workspace with results after running .m: ROC.mat
	View ROC Curve:	ROCPP1.fig
	SnapShots: ROCPP1CodeCurve.jpg, ROCPP1.jpg


Step7:
Predictor Importance:
	Imported data in Matlab: PredictorImpData.mat
	Predictor Importance using decision tree: PredictorImp.m
	Workspace with results after running .m: PredictorImp.mat
	View Chart: PredictorImpChart.fig
	SnapShots: PredictorImpCodeChart.jpg, PredictorImpChart.jpg


Step8:
Data Processing: Features- Age, Education_number, MaritalStatus, Occupation, Relationship, Gender and HoursPerWeek
	Excel: (import into matlab) AdultDataTrain_Final2PIFeatRem.xlxs, AdultDataTest_Final2PIFeatRem.xlxs
        Imported above excel in Matlab : DataPreProcessed2.mat
	Traning Models:-
		Descision Tree: DecisionTreePP2.m
			Workspace with results after running .m: DecisionTreePP2.mat
			ConfusinMatrix: DtreePP2CM.fig
			View tree: DtreePP2Tree.fig
			SnapShots: DTreePP2CodeCM.jpg, DtreePP2CM.jpg, DTreePP2Tree.jpg
		k-Nearest Neighbor: kNearestNeighborPP2.m
			Workspace with results after running .m : kNearestNeighborPP2.mat
			ConfusinMatrix: kNNPP2CM.fig
			SnapShots: kNNPP2CodeCM.jpg, knnPP2CM.jpg
		Naive-Bayes: NaiveBayesPP2.m
			Workspace with results after running .m : NaiveBayesPP2.mat
			ConfusinMatrix: NaiveBayesPP2CM.jpg
			SnapShots: NaiveBayesPP2CodeCM.jpg, NaiveBayesPP2CM.jpg


Step9:
Data Processing: Features- Age, Education_number, MaritalStatus, Occupation, Relationship and HoursPerWeek
	Excel: (import into matlab) AdultDataTrain_Final3PIGenderRem.xlxs, AdultDataTest_Final3PIGenderRem.xlxs
        Imported above excel in Matlab : DataPreProcessed3.mat
	Traning Models:-
		Descision Tree: DecisionTreePP3.m
			Workspace with results after running .m: DecisionTreePP3.mat
			ConfusinMatrix: DtreePP3CM.fig
			View tree: DtreePP3Tree.fig
			SnapShots: DTreePP3CodeCM.jpg, DtreePP3CM.jpg, DTreePP3Tree.jpg
		k-Nearest Neighbor: kNearestNeighborPP3.m
			Workspace with results after running .m : kNearestNeighborPP3.mat
			ConfusinMatrix: kNNPP3CM.fig
			SnapShots: kNNPP3CodeCM.jpg, knnPP3CM.jpg
		Naive-Bayes: NaiveBayesPP3.m
			Workspace with results after running .m : NaiveBayesPP3.mat
			ConfusinMatrix: NaiveBayesPP3CM.jpg
			SnapShots: NaiveBayesPP3CodeCM.jpg, NaiveBayesPP3CM.jpg


Step10:
Data Processing: Features- Age, Education_number and MaritalStatus
	Excel: (import into matlab) AdultDataTrain_Final4AgeEduMS.xlxs, AdultDataTest_Final4AgeEduMS.xlxs
        Imported above excel in Matlab : DataPreProcessed4.mat
	Traning Models:-
		Descision Tree: DecisionTreePP4.m
			Workspace with results after running .m: DecisionTreePP4.mat
			ConfusinMatrix: DtreePP4CM.fig
			View tree: DtreePP4Tree.fig
			SnapShots: DTreePP4CodeCM.jpg, DtreePP4CM.jpg, DTreePP4Tree.jpg
		k-Nearest Neighbor: kNearestNeighborPP4.m
			Workspace with results after running .m : kNearestNeighborPP4.mat
			ConfusinMatrix: kNNPP4CM.fig
			SnapShots: kNNPP4CodeCM.jpg, knnPP4CM.jpg
		Naive-Bayes: NaiveBayesPP4.m
			Workspace with results after running .m : NaiveBayesPP4.mat
			ConfusinMatrix: NaiveBayesPP4CM.jpg
			SnapShots: NaiveBayesPP4CodeCM.jpg, NaiveBayesPP4CM.jpg


Step11:
Data Processing: Features- Age, Education_number and Relationship
	Excel: (import into matlab) AdultDataTrain_Final5AgeEduRela.xlxs, AdultDataTest_Final5AgeEduRela.xlxs
        Imported above excel in Matlab : DataPreProcessed5.mat
	Traning Models:-
		Descision Tree: DecisionTreePP5.m
			Workspace with results after running .m: DecisionTreePP5.mat
			ConfusinMatrix: DtreePP5CM.fig
			View tree: DtreePP5Tree.fig
			SnapShots: DTreePP5CodeCM.jpg, DtreePP5CM.jpg, DTreePP5Tree.jpg
		k-Nearest Neighbor: kNearestNeighborPP5.m
			Workspace with results after running .m : kNearestNeighborPP5.mat
			ConfusinMatrix: kNNPP5CM.fig
			SnapShots: kNNPP5CodeCM.jpg, knnPP5CM.jpg
		Naive-Bayes: NaiveBayesPP5.m
			Workspace with results after running .m : NaiveBayesPP5.mat
			ConfusinMatrix: NaiveBayesPP5CM.jpg
			SnapShots: NaiveBayesPP5CodeCM.jpg, NaiveBayesPP5CM.jpg


Step12:
Performing ROC for the above dataset. ROC needs labels in 'b' and 'g'. So have changed <=50 as 'b' and >50 as 'g'.
	Excel: (import into matlab) AdultDataTrain_Final5AgeEduRela.xlxs, AdultDataTest_Final5AgeEduRela.xlxs, trainbglabelROC2.xlxs, testbglabelROC2.xlxs
        Imported above excel in Matlab : ROCData2.mat
	ROC: ROC2.m
	Workspace with results after running .m: ROC2.mat
	View ROC Curve:	ROC2.fig
	SnapShots: ROC2CodeCurve.jpg, ROC2.jpg


Step13:
Data Processing: Features- Age, Education_number, Occupation and Relationship
	Excel: (import into matlab) AdultDataTrain_Final6AgeEduOccRela.xlxs, AdultDataTest_Final6AgeEduOccRela.xlxs
        Imported above excel in Matlab : DataPreProcessed6.mat
	Traning Models:-
		Descision Tree: DecisionTreePP6.m
			Workspace with results after running .m: DecisionTreePP6.mat
			ConfusinMatrix: DtreePP6CM.fig
			View tree: DtreePP6Tree.fig
			SnapShots: DTreePP6CodeCM.jpg, DtreePP6CM.jpg, DTreePP6Tree.jpg
		k-Nearest Neighbor: kNearestNeighborPP6.m
			Workspace with results after running .m : kNearestNeighborPP6.mat
			ConfusinMatrix: kNNPP6CM.fig
			SnapShots: kNNPP6CodeCM.jpg, knnPP6CM.jpg
		Naive-Bayes: NaiveBayesPP6.m
			Workspace with results after running .m : NaiveBayesPP6.mat
			ConfusinMatrix: NaiveBayesPP6CM.jpg
			SnapShots: NaiveBayesPP6CodeCM.jpg, NaiveBayesPP6CM.jpg


Step14:
PCA for MaritalStatus and Relationship. Both the columns are seperated in to 2 excel sheets.
	Excel: (import into matlab) AdultDataTrain_MS.xlxs, AdultDataTrain_Rela.xlxs, AdultDataTest_MS.xlxs, AdultDataTest_Rela.xlxs
	Excel (results after PCA) : PCATrain.xlxs, PCATest.xlxs
        Imported above excel in Matlab : PCATrainData.mat, PCATestData.mat
	PCA Train and Test: PCATrain.m, PCATest.m 
	Workspace with results after running .m: PCATrain.mat, PCATest.mat
	SnapShots: PCATrain.jpg, PCATest.jpg


Step15:
Data Processing: Features- Age, Education_number and PCA applied on MaritalStatus and Relationship
	Excel: (import into matlab) AdultDataTrain_Final7PCA.xlxs, AdultDataTest_Final7PCA.xlxs
        Imported above excel in Matlab : DataPreProcessed7PCA.mat
	Traning Models:-
		Descision Tree: DecisionTreePP7.m
			Workspace with results after running .m: DecisionTreePP7.mat
			ConfusinMatrix: DtreePP7CM.fig
			View tree: DtreePP7Tree.fig
			SnapShots: DTreePP7CodeCM.jpg, DtreePP7CM.jpg, DTreePP7Tree.jpg
		k-Nearest Neighbor: kNearestNeighborPP7.m
			Workspace with results after running .m : kNearestNeighborPP7.mat
			ConfusinMatrix: kNNPP7CM.fig
			SnapShots: kNNPP7CodeCM.jpg, knnPP7CM.jpg
		Naive-Bayes: NaiveBayesPP7.m
			Workspace with results after running .m : NaiveBayesPP7.mat
			ConfusinMatrix: NaiveBayesPP7CM.jpg
			SnapShots: NaiveBayesPP7CodeCM.jpg, NaiveBayesPP7CM.jpg


Step16:
Performing ROC for the above PCAdataset. ROC needs labels in 'b' and 'g'. So have changed <=50 as 'b' and >50 as 'g'.
	Excel: (import into matlab) AdultDataTrain_Final7PCA.xlxs, AdultDataTest_Final7PCA.xlxs, trainbglabelROC2.xlxs, testbglabelROC2.xlxs
        Imported above excel in Matlab : DataPreProcessed7PCA.mat, ROCData2.mat
	ROC for PCA: ROCPCA.m
	Workspace with results after running .m: ROCPCA.mat
	View ROC Curve:	ROCPCA.fig
	SnapShots: ROCPCACodeCurve.jpg, ROCPCA.jpg


Step17:
Data Processing: Features- Grouped marital status. Python used to  group.
	Excel: (import into matlab) AdultDataTrain_Final8Group.xlxs, AdultDataTest_Final8Group.xlxs,
        Imported above excel in Matlab : DataPreProcessed8Group.mat
	Traning Models:-
		Descision Tree: DecisionTreePP8.m
			Workspace with results after running .m: DecisionTreePP8.mat
			ConfusinMatrix: DtreePP8CM.fig
			View tree: DtreePP8Tree.fig
			SnapShots: DTreePP8CodeCM.jpg, DtreePP8CM.jpg, DTreePP8Tree.jpg
		k-Nearest Neighbor: kNearestNeighborPP8.m
			Workspace with results after running .m : kNearestNeighborPP8.mat
			ConfusinMatrix: kNNPP8CM.fig
			SnapShots: kNNPP8CodeCM.jpg, knnPP8CM.jpg
		Naive-Bayes: NaiveBayesPP8.m
			Workspace with results after running .m : NaiveBayesPP8.mat
			ConfusinMatrix: NaiveBayesPP8CM.jpg
			SnapShots: NaiveBayesPP8CodeCM.jpg, NaiveBayesPP8CM.jpg


Step18:
Performing ROC for the above grouped dataset. ROC needs labels in 'b' and 'g'. So have changed <=50 as 'b' and >50 as 'g'.
	Excel: (import into matlab) AdultDataTrain_Final8Group.xlxs, AdultDataTest_Final8Group.xlxs, trainbglabelROC2.xlxs, testbglabelROC2.xlxs
        Imported above excel in Matlab : DataPreProcessed8Group.mat, ROCData2.mat
	ROC for group: ROCGroup.m
	Workspace with results after running .m: ROCGroup.mat
	View ROC Curve:	ROCGroup.fig
	SnapShots: ROCGroupCodeCurve.jpg, ROCGroup.jpg


Step19:
Data Processing: Features- Age and Education_number
	Excel: (import into matlab) AdultDataTrain_Final9AgeEdu.xlxs, AdultDataTest_Final9AgeEdu.xlxs, 
        Imported above excel in Matlab : DataPreProcessed9.mat
	Traning Models:-
		Descision Tree: DecisionTreePP9.m
			Workspace with results after running .m: DecisionTreePP9.mat
			ConfusinMatrix: DtreePP9CM.fig
			View tree: DtreePP9Tree.fig
			SnapShots: DTreePP9CodeCM.jpg, DtreePP9CM.jpg, DTreePP9Tree.jpg
		k-Nearest Neighbor: kNearestNeighborPP9.m
			Workspace with results after running .m : kNearestNeighborPP9.mat
			ConfusinMatrix: kNNPP9CM.fig
			SnapShots: kNNPP9CodeCM.jpg, knnPP9CM.jpg
		Naive-Bayes: NaiveBayesPP9.m
			Workspace with results after running .m : NaiveBayesPP9.mat
			ConfusinMatrix: NaiveBayesPP9CM.jpg
			SnapShots: NaiveBayesPP9CodeCM.jpg, NaiveBayesPP9CM.jpg












