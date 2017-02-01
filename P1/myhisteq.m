% Austin Schaumberg
% CS 534 | Fall 2016
% HW2-P1: myhisteq.m
function [ J ] = myhisteq( I )
% myhisteq: This takes an input image and examines the histogram.
%           Next equalizes the histogram to balance the color channels of
%           an image. This is different from MatLab's packaged Histogram
%           equilization in that the function will allow for the 
%           equalization of color images.
%   Step 1: convert an input color image from RGB to HSV color space 
%           (uses rgb2hsv, which creates a double image)
%
I = rgb2hsv(I);
J = im2uint8(I);
V = J(:,:,3); 
% Set initial histogram vals to 0
Hist = zeros(256,1);
% Set rows & cols of image
[rows,cols] = size(V);
%   Step 2: Compute the histogram and cumulative histogram 
%           of the V (luminance) image only [lines 24 - 34]
for i=1:rows
    for j=1:cols
        k = V(i,j) + 1;
        Hist(k,1) = Hist(k,1) + 1;
    end
end
% Initialize cumulative sum histogram to 0
CSum = zeros(256,1);
for j=1:256
    CSum(j, 1) = sum( Hist(1:j,1) );
end
%   Step 3: transforming the intensity values in V to occupy the full 
%           range 0..255 in a new image W so that the histogram of W 
%           is roughly ?flat?
W = V;
for j=1:rows
    for k=1:cols
        W(j,k) = max(0, ((256/(rows*cols)) * CSum( V(j,k)+1) ) -1);
    end
end
% Uncomment lines 44 - 45 to retrieve Whist visual and VHist visual
% Figure 1 & 3 are VHists, Figure 2 & 4 are their respecitve WHists
% These figures have an X scale of 0-256
% figure; imhist(V); 
% figure; imhist(W);
%
%    Step 4: combine the original H and S channels with the W image to
%            create a new color image, which is then converted to an RGB
%            color output image (using hsv2rgb)
I(:,:,3) = W;
% hist -> RGB
J = hsv2rgb(I);
% int -> double
J = uint8(J);
% Uncomment 61 - 64 to view appropriate WHist
% These figures have an X scale of 0-1
% img = J;
% img = im2double(rgb2hsv(img));
% V = img(:,:,3);
% figure;imhist(V);
end