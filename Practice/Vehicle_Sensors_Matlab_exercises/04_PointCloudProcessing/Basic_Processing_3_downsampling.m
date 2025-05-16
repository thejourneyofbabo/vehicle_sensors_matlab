%%  File Name: MATLAB_Basic_03_given.m %%%%%%%%%%%%%%%%%%%%
%
%  Description: Downsample point cloud using box grid filter.
%              
%
%  Copyright 2019 MathWorks, Inc. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all;
%% Read a point cloud.
InputPointCloud = pcread('teapot.ply');

%%%%%%%%%% TODO %%%%%%%%%%
% Visualize point cloud.
pcshow(XXXXXXXXX);

xlabel('X');
ylabel('Y');
zlabel('Z');
set(gcf,'color','w');
set(gca,'color','w');
set(gca, 'XColor', [0. 0. 0.], 'YColor', [0. 0. 0.], 'ZColor', [0. 0. 0.])
title({'Creating a Point Cloud'},'FontSize', 14, 'Color', 'black')

%% Random sample downsample method
% Set the random sampling percentage.
percentage = 0.4;

%%%%%%%%%% TODO %%%%%%%%%%
% Downsample point cloud using random sample method.
randomDownsampledPointCloud = pcdownsample(InputPointCloud, XXXXXXXXX, XXXXXXXXX);

% Visualize the downsampled data.
figure;
pcshow(randomDownsampledPointCloud);
xlabel('X');
ylabel('Y');
zlabel('Z');
set(gcf,'color','w');
set(gca,'color','w');
set(gca, 'XColor', [0. 0. 0.], 'YColor', [0. 0. 0.], 'ZColor', [0. 0. 0.])
title({'Random sample downsample method'},'FontSize', 14, 'Color', 'black')

%% Gridsample downsample method
% Set the 3-D resolution to be (0.1 x 0.1 x 0.1).
gridStep = 0.3;

%%%%%%%%%% TODO %%%%%%%%%%
% Downsample point cloud using grid average method.
GridAverageDownsampledPointCloud = pcdownsample(InputPointCloud, XXXXXXXXX, XXXXXXXXX);

% Visualize the downsampled data.
figure();
pcshow(GridAverageDownsampledPointCloud);
xlabel('X');
ylabel('Y');
zlabel('Z');
set(gcf,'color','w');
set(gca,'color','w');
set(gca, 'XColor', [0. 0. 0.], 'YColor', [0. 0. 0.], 'ZColor', [0. 0. 0.])
title({'Gridsample downsample method'},'FontSize', 14, 'Color', 'black')

%% Nonuniform GridSample downsample method
% Set the maximum number of points in grid box
maxNumPoints = 10;

%%%%%%%%%% TODO %%%%%%%%%%
% Downsample point cloud using nonuniform grid sample method.
nonuniformGridSampleDownsample = pcdownsample(InputPointCloud, XXXXXXXXX, XXXXXXXXX);

% Visualize the downsampled data.
figure();
pcshow(nonuniformGridSampleDownsample);
xlabel('X');
ylabel('Y');
zlabel('Z');
set(gcf,'color','w');
set(gca,'color','w');
set(gca, 'XColor', [0. 0. 0.], 'YColor', [0. 0. 0.], 'ZColor', [0. 0. 0.])
title({'Nonuniform GridSample downsample method'},'FontSize', 14, 'Color', 'black')
