% Austin Schaumberg
% CS 534 | Fall 2016
% HW2-P3: mycolortransfer.m
function [ K ] = mycolortransfer( I,J )
%mycolortransfer: Modify colors of one image based on colors in a 2nd image
%           I = the RGB input source image (the one you want to change)
%           J = the palette (target) input image (i.e., the image you want
%               to steal the colors from),
%           K = the output RGB image. K should either be a [0,1] 
%               double image or a [0,255] uint8 image

% Convert images from RGB to L*a*b* color spaces
source = rgb2lab(I);
target = rgb2lab(J);
% Set source variables
L_source = source(:,:,1);
a_source = source(:,:,2);
b_source = source(:,:,3);
% Set target variables
L_target = target(:,:,1);
a_target = target(:,:,2);
b_target = target(:,:,3);
% Calculate source-mean(source) for respective channel values of L*a*b*
L_src_mean_diff = (L_source - mean2(L_source));
a_src_mean_diff = (a_source - mean2(a_source));
b_src_mean_diff = (b_source - mean2(b_source));
% Calculate source standard deviations
L_source_stddev = std2(L_source);
a_source_stddev = std2(a_source);
b_source_stddev = std2(b_source);
% Compute the mean of targets
L_target_mean = mean2(L_target);
a_target_mean = mean2(a_target);
b_target_mean = mean2(b_target);
% Calculate target standard deviations
L_target_stddev = std2(L_target);
a_target_stddev = std2(a_target);
b_target_stddev = std2(b_target);
% Compute final output values
L_out = (L_target_stddev/L_source_stddev)*L_src_mean_diff + L_target_mean;
a_out = (a_target_stddev/a_source_stddev)*a_src_mean_diff + a_target_mean;
b_out = (b_target_stddev/b_source_stddev)*b_src_mean_diff + b_target_mean;
% Combine the 3 output values into a 3D matrix (K)
K(:,:,1) = L_out;
K(:,:,2) = a_out;
K(:,:,3) = b_out;
im2uint8(K);
end

