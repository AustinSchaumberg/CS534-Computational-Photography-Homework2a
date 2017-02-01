% Austin Schaumberg
% CS 534 | Fall 2016
% HW2-P3: main_P3.m
clc;clear;close all;
% Set source file and target file
source = imread('P3-source.jpg');
target = imread('P3-target.jpg');
% Convert image to L*a*b*
out = mycolortransfer(source,target);
% Convert to RGB
out = lab2rgb(out);
% Create combined output file as .jpg
imwrite(out,'P3-out.jpg');
% Below area used to make personal output files:
clc;clear;
% Set source file and target file
source = imread('P3-mysource.jpg');
target = imread('P3-mytarget.jpg');
% convert image to L*a*b*
out = mycolortransfer(source,target);
% convert back to RGB
out = lab2rgb(out);
% Create combined output file as .jpg
imwrite(out,'P3-myout.jpg');
clc;clear;