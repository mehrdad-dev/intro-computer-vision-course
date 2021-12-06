clc;
clear all;
close all;

im = imread('head.jpeg');
im = rgb2gray(im);   % Convert to GrayScale
new_im = 255 - im;  % Apply the transform

figure(1);
imshowpair(im, new_im,'montage');
