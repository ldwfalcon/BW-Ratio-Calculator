% By: Luis Daniel Weiss (ldwfalcon)
% Calculate percent of x brightness in an image
%Calibrate brightness by importing the calibrating imaage and adjusting the
%threshold to obatain the wanted value
%Calibration image: BW_Ratio_Calc_Calibration_Image.png
%Calibration image with percent values of black: BW_Ratio_Calc_Calibration_Values_Image.png

%import image
imgOriginal = imread('Da_File.image');

%convert rbg image to greyscale imgae
img = rgb2gray(imgOriginal);

%get median value of image (0-255)
medianVal = median(img(:));

%threshold value, between 0 & 255. Higher means darker greys will be counted as white 
threshVal = 100;

%Creates binary image (1 for white or 0 for black) based on threshold value
binaryImg = img >= threshVal;

%vount pixels in image
numPixs = numel(binaryImg);

%get # of black and white pixels, 1=white, 0= black
num_black_pixs = sum(binaryImg(:) == 0);
num_white_pixs = sum(binaryImg(:) == 1);

tot_pixs = num_white_pixs+num_black_pixs;

%get % of pixels
percent_white = num_white_pixs/tot_pixs*100;
percent_black = num_black_pixs/tot_pixs*100;

%outut # of black and white pixels (used to ensure all pixels are counted)
fprintf('Number of black pixels: %d\n', num_black_pixs);
fprintf('Number of white pixels: %d\n', num_white_pixs);

%output total # of pixels
disp(['The number of pixels in the image is: ', num2str(numPixs)]); 

%output median value of greyscale image
fprintf('Median Val of image: %.2f\n', medianVal); 

%output % of white and black pixels
fprintf('Percent of black pixels: %.2f%%\n', percent_black);
fprintf('Percent of white pixels: %.2f%%\n', percent_white);


% MIT License
% 
% Copyright (c) 2023 ldwfalcon
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
