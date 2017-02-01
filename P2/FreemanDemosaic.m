% Austin Schaumberg
% CS 534 | Fall 2016
% HW2-P2: FreemanDemosaic.m
function [ J ] = FreemanDemosaic( I )
%FreemanDemosaic: I is the Bayer Pattern image, J is an RGB image
%   Bill Freeman proposed an improvement to the simple bilinear 
%   interpolation approach. Since the G channel is sampled at a 
%   higher rate than the R and B channels, one would expect interpolation
%   to work better for G values. Then it would make sense to use the 
%   interpolated G channel to modify the interpolated R and B channels.

% Convert image data type to double
img = im2double( I );
% Obtain values
[rows,cols] = size( img );
% Initialize 3 channel output image, zero out all values
J = zeros(rows, cols, 3);
% Initialze zeroed out arrays for 
% each of the color channels
R_Ch = zeros(rows,cols);
G_Ch = zeros(rows,cols);
B_Ch = zeros(rows,cols);
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
% Each color channel is initialized as a filter
RED = imfilter(R_Ch,RB_Filter,0);
GREEN = imfilter(G_Ch, G_Filter,0);
BLUE = imfilter(B_Ch,RB_Filter,0);
% Computes the difference in images R-G and B-G between the respective
% interpolated channels. Mosaicing artifacts tend to show up as small
% "splotches" in these images. To eliminate the "splotches", apply
% median filtering (use the medfilt2 command in MATLAB) 
% to the R-G and B-G images.
RED_free= medfilt2(RED - GREEN);
BLUE_free= medfilt2(BLUE - GREEN);
% Create the modified R and B channels by adding the G channel to the
% respective difference images. 
REDfree = GREEN + RED_free;
BLUEfree = BLUE + BLUE_free;
% Map new Freeman values to their proper color channels
J(:,:,1) = REDfree;
J(:,:,2) = GREEN;
J(:,:,3) = BLUEfree;
im2uint8(J);
end
