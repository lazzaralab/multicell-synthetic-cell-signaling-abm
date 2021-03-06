clear all; close all; clc;
% copyfile('CalcFeatures_HomoHetero_2.m', 'Homotypic-Heterotypic_SensitivityAnalysis_4');
% cd('Homotypic-Heterotypic_SensitivityAnalysis_4')
folders = dir('*A|*');
all_features_ratios = [];

for k = 1:length(folders)
    curDir = folders(k).name;
    copyfile('CalcFeatures_CoreShell.m', curDir);
    copyfile('findregionboundary.m', curDir);
    cd(curDir)
    features = CalcFeatures_CoreShell(curDir);
    all_features_ratios = [all_features_ratios; features];
    cd ..
    disp("" + curDir + " done")
end
disp("all folders processed")
head = ["Ratio","Radius","Feature","Value"];
writematrix([head;all_features_ratios], 'Core_Shell_all_features_ratios.xlsx');
cd ..