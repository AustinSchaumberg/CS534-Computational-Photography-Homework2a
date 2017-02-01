% Austin Schaumberg
% CS 534 | Fall 2016
% HW2-P2: mydemosaic.m
function [ J ] = mydemosaic( I )
%mydemosaic.m: 
%   Detailed explanation goes here

% Convert image data type to double
img = im2double( I );
% Obtain values
[row,col] = size( img );
% Initialize 3 channel output image, zero out all values
J = zeros(row, col, 3);
% Initialze zeroed out arrays for 
% each of the color channels
R_Ch = zeros(row,col);
G_Ch = zeros(row,col);
B_Ch = zeros(row,col);
% Capture color values already existing within the input image
% (2x2 Color visualizaiton:    |R|G|)
% (                            |G|B|)
R_Ch(1:2:end,1:2:end) = img(1:2:end,1:2:end);
G_Ch(2:2:end,1:2:end) = img(2:2:end,1:2:end);
B_Ch(2:2:end,2:2:end) = img(2:2:end,2:2:end);
G_Ch(1:2:end,2:2:end) = img(1:2:end,2:2:end);
% Computer filters for demosaic, will be utilized by the 'imfilter'
% Filter element values represent if there exists: 2(.5), 4(.25), OR 1(1)
% neighboring squares of correlating color(s).
RB_Filter =  [0.25,0.5 ,0.25; 0.5 ,1,0.5 ; 0.25,0.5 ,0.25];
G_Filter  =  [0   ,0.25,0   ; 0.25,1,0.25; 0   ,0.25,0   ];
% Each color channel is commited to the matching channel in image J 
J(:,:,1) = imfilter(R_Ch,RB_Filter,0);
J(:,:,2) = imfilter(G_Ch, G_Filter,0);
J(:,:,3) = imfilter(B_Ch,RB_Filter,0);
im2uint8(J);
end

