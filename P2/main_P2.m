% Austin Schaumberg
% CS 534 | Fall 2016
% HW2-P2: main_P2.m
clc;clear;close all;
% Demosaic 1st image:
img = imread('P2-crayons-raw.bmp'); 
J1 = mydemosaic(img); 
imwrite(J1, 'P2-crayons-demosaic.jpg', 'jpg');
% Freeman Demosaic 1st image:
J1a = FreemanDemosaic(img);
imwrite(J1a, 'P2-crayons-freeman.jpg', 'jpg');
% Lines 14-17 compare 1st Demosaic image to original and show error,
% if existing, in white(in an otherwise black photo).
clc;clear;
imgNew = imread('P2-crayons-demosaic.jpg');
imgOld = imrotate(imread('P2-crayons.jpg'),0);
J2 = demosaicevaluation(imgNew,imgOld);
figure; imshow(J2,[0,255]);
% 2nd Demosaic image 
img = imread('P2-union-raw.bmp'); 
J3 = mydemosaic(img); 
imwrite(J3, 'P2-union-demosaic.jpg', 'jpg');
% Freeman Demosaic of 2nd image
J3a = FreemanDemosaic(img);
imwrite(J3a, 'P2-union-freeman.jpg', 'jpg');
% Compare 2nd Demosaic image to original
clc;clear;
imgNew = imread('P2-union-demosaic.jpg');
imgOld = imrotate(imread('P2-union.jpg'),90);
J4 = demosaicevaluation(imgNew,imgOld);
figure; imshow(J4,[0,255]);
clc;clear;