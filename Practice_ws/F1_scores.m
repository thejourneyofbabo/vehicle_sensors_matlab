clc; close all; clear;

% Define confusion matrix data
cm = [
    923, 4, 21, 8, 4, 1, 5, 5, 23, 6;
    5, 972, 2, 0, 0, 0, 0, 1, 5, 15;
    26, 2, 892, 30, 13, 8, 17, 5, 4, 3;
    12, 4, 32, 826, 24, 48, 30, 12, 5, 7;
    5, 1, 28, 24, 898, 13, 14, 14, 2, 1;
    7, 2, 28, 111, 18, 801, 13, 17, 0, 3;
    5, 0, 16, 27, 3, 4, 343, 1, 1, 0;
    9, 1, 14, 13, 22, 17, 3, 915, 2, 4;
    37, 10, 4, 4, 0, 1, 2, 1, 931, 10;
    20, 39, 3, 3, 0, 2, 0, 1, 9, 923
];

% Define class labels
class_labels = {'airplane', 'automobile', 'bird', 'cat', 'deer', 'dog', 'frog', 'horse', 'ship', 'truck'};

% Create figure
figure('Position', [100, 100, 800, 700]);

% Create heatmap
h = heatmap(class_labels, class_labels, cm);
h.Title = '';
h.XLabel = 'Predicted Class';
h.YLabel = 'True Class';
h.CellLabelColor = 'auto';

% Highlight the diagonal (correct predictions)
colormap([0.8 0.8 0.8; jet(256)]);

diag_cm = diag(cm);
F1_matrix = zeros(size(diag_cm,1),1);

for ci = 1:size(diag_cm, 1)
    F1_matrix(ci) = (2 * diag_cm(ci)) / (sum(cm(ci,:)) + sum(cm(:, ci)));
end

% mean_F1_Scores = adder / size(diag_cm, 1);
mean_F1_Scores = mean(F1_matrix);

disp('Mean F1 Scores:');
disp(mean_F1_Scores);

figure;
heatmap(diag(F1_matrix));
title(['Mean F1 Scores: ' num2str(mean_F1_Scores, '%.4f')]);