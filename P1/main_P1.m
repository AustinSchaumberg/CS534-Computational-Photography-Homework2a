% Austin Schaumberg
% CS 534 | Fall 2016
% HW2-P1: main_P1.m
clc;clear;close all;
% Output/write 1st image
img = imread('P1-bridge.jpg');
out = myhisteq(img);
imwrite(out, 'P1-bridge-out.jpg');
% Uncomment lines 11-13 to view VHist
% These figures have the appropriate X scale of 0-1
%img = im2double(rgb2hsv(img));
%V = img(:,:,3);
%figure;imhist(V);

%% Output/write 2nd image
img = imread('P1-snow.jpg');
out = myhisteq(img);
imwrite(out, 'P1-snow-out.jpg');
% Uncomment lines 21-23 to view VHist
% These figures have the appropriate X scale of 0-1
% img = im2double(rgb2hsv(img));
% V = img(:,:,3);
% figure;imhist(V);
clc;clear;