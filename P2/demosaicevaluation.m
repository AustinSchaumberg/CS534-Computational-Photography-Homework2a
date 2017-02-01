% Austin Schaumberg
% CS 534 | Fall 2016
% HW2-P2: demosacievaluation.m
function [ J ] = demosaicevaluation( K,L )
%demosacievaluation.m: This function takes two (supposedly similar) RGB 
%                      images and calculates thier squared difference.
K = im2double(K);
L = im2double(L);
J = zeros(size(K,1),size(K,2));
% Retrieve the values of each image's color channel separately
[rows,cols,RGBCh] = size(K);
R_Ch1 = K(:,:,1); R_Ch2 = L(:,:,1);
G_Ch1 = K(:,:,2); G_Ch2 = L(:,:,2);
B_Ch1 = K(:,:,3); B_Ch2 = L(:,:,3);
% For loop goes through color channels and 
% calculates difference for each color channel
% Then calculates the square of the difference for each color channel
for i = 1:rows
    for j = 1:cols
        J(i,j)=(R_Ch1(i,j)-R_Ch2(i,j)).^2 +(G_Ch1(i,j)-G_Ch2(i,j)).^2+(B_Ch1(i,j)-B_Ch2(i,j)).^2;
    end
end
J = im2uint8(J);
end

