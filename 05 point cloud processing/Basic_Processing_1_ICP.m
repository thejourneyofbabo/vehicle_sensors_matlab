%%  File Name: Search_Registration_05_given.m %%%%%%%%%%%%%%%%%%%%
%
%  Description: Registration of two point clouds using Iterative Closest Point (ICP)
%
%  Copyright 2019 MathWorks, Inc. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all;
%% Align Two Point Clouds Using ICP Algorithm
% Load point cloud data.
ptCloud = pcread('teapot.ply');

pcshow(ptCloud); 
title('Teapot');

%%%%%%%%%% TODO %%%%%%%%%%
% Create a transform object with 30 degree rotation along z-axis and translation [5,5,10].
A = [cos(pi/6) -sin(pi/6) 0 5; ...
    sin(pi/6) cos(pi/6) 0 5; ...
            0      0 1 10; ...
            0      0 0 1];
tform1 = affinetform3d(A);

% Transform the point cloud.
ptCloudTformed = pctransform(ptCloud,tform1);
figure;
pcshow(ptCloudTformed);
title('Transformed Teapot');

%%%%%%%%%% TODO %%%%%%%%%%
% Apply the rigid registration.
tform = pcregistericp(ptCloudTformed, ptCloud,'Extrapolate',true); %% Recheck!!!#####

% Compare the result with the true transformation.
disp(tform1);

tform2 = invert(tform);
disp(tform2);